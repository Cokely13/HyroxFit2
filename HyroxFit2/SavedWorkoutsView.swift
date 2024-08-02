import SwiftUI

struct SavedWorkoutsView: View {
    @State private var workouts: [Workout] = []
    @State private var selectedFilter: String = "All" // State for the selected filter
    @State private var showClosedAlert: Bool = false // State for showing alert

    let exercises = ["All", "Run", "Swim", "Bike", "Ski", "Row", "Closed"] // Options for the dropdown

    var filteredWorkouts: [Workout] {
        switch selectedFilter {
        case "Closed":
            return workouts.filter { $0.endDate < Date() } // Filter for closed workouts
        case "All":
            return workouts.filter { $0.endDate >= Date() } // Show all open workouts
        default:
            return workouts.filter { $0.exercise == selectedFilter && $0.endDate >= Date() } // Filter for selected exercise excluding closed workouts
        }
    }

    var body: some View {
        VStack {
            Text("Saved Workouts")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)

            // Dropdown menu for filtering
            Picker("Filter by Exercise", selection: $selectedFilter) {
                ForEach(exercises, id: \.self) { exercise in
                    Text(exercise).tag(exercise)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()

            // List of filtered workouts
            List(filteredWorkouts) { workout in
                Button(action: {
                    if workout.endDate < Date() {
                        showClosedAlert = true
                    } else {
                        // Navigate to EnterResultsView
                        navigateToEnterResultsView(for: workout)
                    }
                }) {
                    VStack(alignment: .leading) {
                        Text(workout.name)
                            .font(.headline)
                        Text("Created By: \(workout.username)")
                            .font(.subheadline)
                            .foregroundColor(.black)
                        Text("Exercise: \(workout.exercise)")
                        Text("Distance: \(workout.distance) meters")
                        Text("Start Date: \(workout.startDate, formatter: dateFormatter)")
                        Text("End Date: \(workout.endDate, formatter: dateFormatter)")
                    }
                    .padding(.vertical, 5)
                }
            }
        }
        .onAppear(perform: loadWorkouts)
        .alert(isPresented: $showClosedAlert) {
            Alert(title: Text("Workout Closed"), message: Text("This Workout is Closed."), dismissButton: .default(Text("OK")))
        }
        .padding()
    }

    func loadWorkouts() {
        if let savedWorkoutsData = UserDefaults.standard.data(forKey: "savedWorkouts"),
           let savedWorkouts = try? JSONDecoder().decode([Workout].self, from: savedWorkoutsData) {
            workouts = savedWorkouts
        }
    }

    // Method to navigate to EnterResultsView safely
    func navigateToEnterResultsView(for workout: Workout) {
        // Get the connected scenes
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return
        }

        window.rootViewController = UIHostingController(rootView: EnterResultsView(workout: workout).environmentObject(AuthState()))
        window.makeKeyAndVisible()
    }
}

struct SavedWorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedWorkoutsView()
    }
}

// Date formatter to format the date
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()

