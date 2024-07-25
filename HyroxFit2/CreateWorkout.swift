import SwiftUI

struct CreateWorkout: View {
    @State private var workoutName: String = ""
    @State private var selectedExercise: String = "Run"
    @State private var thousands: Int = 0
    @State private var hundreds: Int = 1
    @State private var tens: Int = 0
    @State private var units: Int = 0
    @State private var navigateToConfirmation: Bool = false

    let exercises = ["Run", "Swim", "Bike", "Ski", "Row"]
    let digits = Array(0...9)

    var selectedDistance: Int {
        return (thousands * 1000) + (hundreds * 100) + (tens * 10) + units
    }

    var body: some View {
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

            NavigationLink(destination: WorkoutCreatedView(), isActive: $navigateToConfirmation) {
                Button(action: {
                    navigateToConfirmation = true
                    print("Workout Created: \(workoutName), \(selectedExercise), \(selectedDistance) meters")
                }) {
                    Text("Create Workout")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding(.top, 20)

            Spacer()
        }
        .padding()
        .navigationBarTitle("Create Workout", displayMode: .inline)
    }
}

struct CreateWorkout_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CreateWorkout()
        }
    }
}

