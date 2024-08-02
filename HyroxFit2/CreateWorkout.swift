import SwiftUI

struct CreateWorkout: View {
    @State private var workoutName: String = ""
    @State private var selectedExercise: String = "Run"
    @State private var thousands: Int = 0
    @State private var hundreds: Int = 1
    @State private var tens: Int = 0
    @State private var units: Int = 0
    @State private var navigateToConfirmation: Bool = false
    @State private var startDate: Date = Date() // Automatically set start date to current date
    @State private var endDate: Date = Date() // End date selection
    @State private var showAlert: Bool = false // State for showing alert
    @State private var alertMessage: String = "" // Message to display in the alert

    @EnvironmentObject var authState: AuthState

    let exercises = ["Run", "Swim", "Bike", "Ski", "Row"]
    let digits = Array(0...9)

    var selectedDistance: Int {
        return (thousands * 1000) + (hundreds * 100) + (tens * 10) + units
    }

    var body: some View {
        NavigationView {
            ScrollView { // Make the view scrollable
                VStack(alignment: .leading, spacing: 20) {
                    Text("Create Workout")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top)

                    TextField("Name", text: $workoutName)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)

                    Text("Choose Exercise")
                        .font(.headline)
                    Picker("Choose Exercise", selection: $selectedExercise) {
                        ForEach(exercises, id: \.self) { exercise in
                            Text(exercise).tag(exercise)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())

                    Text("Choose Distance (meters)")
                        .font(.headline)
                    
                    HStack {
                        Picker("Thousands", selection: $thousands) {
                            ForEach(digits, id: \.self) { digit in
                                Text("\(digit)").tag(digit)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(width: 60, height: 150)

                        Picker("Hundreds", selection: $hundreds) {
                            ForEach(digits, id: \.self) { digit in
                                Text("\(digit)").tag(digit)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(width: 60, height: 150)

                        Picker("Tens", selection: $tens) {
                            ForEach(digits, id: \.self) { digit in
                                Text("\(digit)").tag(digit)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(width: 60, height: 150)

                        Picker("Units", selection: $units) {
                            ForEach(digits, id: \.self) { digit in
                                Text("\(digit)").tag(digit)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(width: 60, height: 150)
                    }

                    Text("Selected Distance: \(selectedDistance) meters")
                        .font(.headline)
                    
                    // Display the start date (current date) without allowing modification
                    Text("Start Date: \(startDate, formatter: dateFormatter)")
                        .font(.headline)
                        .padding(.bottom, 10)

                    // Add label for end date selection
                    Text("Select EndDate")
                        .font(.headline)
                    
                    DatePicker("End Date", selection: $endDate, in: Date()..., displayedComponents: .date) // Ensures endDate is today or later
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .padding(.bottom, 20)

                    NavigationLink(destination: WorkoutCreatedView(), isActive: $navigateToConfirmation) {
                        EmptyView()
                    }

                    Button(action: {
                        validateAndSaveWorkout()
                    }) {
                        Text("Create Workout")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding(.top, 20)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                    }

                    Spacer()
                }
                .padding()
            }
            .navigationBarTitle("Create Workout", displayMode: .inline)
        }
    }

    func validateAndSaveWorkout() {
        guard let username = authState.username else { return }

        if workoutName.isEmpty {
            alertMessage = "Workout name cannot be empty."
            showAlert = true
            return
        }
        
        if endDate <= startDate {
            alertMessage = "End Date must be after the Start Date."
            showAlert = true
            return
        }

        let workout = Workout(
            id: UUID(),
            name: workoutName,
            exercise: selectedExercise,
            distance: selectedDistance,
            username: username,
            startDate: startDate,
            endDate: endDate
        )
        
        var savedWorkouts = loadWorkouts()
        savedWorkouts.append(workout)
        
        if let encoded = try? JSONEncoder().encode(savedWorkouts) {
            UserDefaults.standard.set(encoded, forKey: "savedWorkouts")
        }

        navigateToConfirmation = true // Navigate to confirmation view
    }
    
    func loadWorkouts() -> [Workout] {
        if let savedWorkoutsData = UserDefaults.standard.data(forKey: "savedWorkouts"),
           let savedWorkouts = try? JSONDecoder().decode([Workout].self, from: savedWorkoutsData) {
            return savedWorkouts
        }
        return []
    }
}

struct CreateWorkout_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CreateWorkout()
                .environmentObject(AuthState())
        }
    }
}

// Formatter to display the date
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()

