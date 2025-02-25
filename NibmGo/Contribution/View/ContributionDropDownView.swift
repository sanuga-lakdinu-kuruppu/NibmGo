import SwiftUI

struct ContributionDropDownView: View {
    @Binding var selectedFacility: String
    var options: [String] = []
    var titleText: String = ""
    var body: some View {
        HStack {
            NormalTextView(
                text: titleText, foregroundColor: .black)
            Spacer()
            Picker("", selection: $selectedFacility) {
                ForEach(
                    options,
                    id: \.self
                ) { facility in
                    NormalTextView(
                        text: facility,
                        foregroundColor: .black)
                }
            }
            .labelsHidden()
        }
    }
}

#Preview {
    //    ContributionDropDownView()
}
