import SwiftUI

struct ContributionView: View {
    @State private var contribution: String = ""
    @State private var availabilityLevel: String = "None"
    @State private var selectedFacility: String = "None"
    
    let availabilityOptions = ["None", "Low", "Medium", "High"]
    
    private var facilityOptions: [String] {
        let allFacilities = FacilityViewModel.shared.getAllFacilities()
        return ["None"] + allFacilities.map { $0.name }
    }

    var body: some View {
        ZStack {
            CommonBackgroundView()
            ScrollView {
                VStack(spacing: 16) {
            
                    HStack {
                        TitleTextView(text: "Contribution")
                        Spacer()
                        Button(action: {
                            addContribution()
                        }) {
                            Text("Add")
                                .font(.headline)
                        }
                    }
                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)

                    List {
                        Section {
                            Picker("Facility", selection: $selectedFacility) {
                                ForEach(facilityOptions, id: \.self) { option in
                                    Text(option).tag(option)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        
                            Picker("Availability Level", selection: $availabilityLevel) {
                                ForEach(availabilityOptions, id: \.self) { level in
                                    Text(level).tag(level)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        Section(footer: Text("Inaccurate data will affect the accuracy of the campus navigator application. Be responsible to enter the accurate data.")) {
                        }
                    }
                    .contentMargins(.vertical, 0)
                    .frame(height: UIScreen.main.bounds.height * 0.6)
                }
                .padding(.top, 32)
            }
        }
    }
    
    private func addContribution() {
        print("Facility: \(selectedFacility), Availability Level: \(availabilityLevel)")
    }
}

#Preview {
    ContributionView()
}
