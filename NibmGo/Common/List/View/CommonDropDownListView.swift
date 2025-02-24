import SwiftUI

struct CommonDropDownListView: View {
    @Binding var user: UserProfileModel
    @Binding var branches: [String]
    var titleText: String
    @State var selectedBranch: String = "Berkely"

    var body: some View {
        HStack {
            NormalTextView(
                text: titleText, foregroundColor: .black)
            Spacer()
            Picker("", selection: $selectedBranch) {
                ForEach(branches, id: \.self) { branch in
                    NormalTextView(
                        text: branch, foregroundColor: .black)
                }
            }
            .labelsHidden()
            .onChange(of: selectedBranch) {
                user.primaryBranch = selectedBranch
            }
        }
    }
}

#Preview {
    //    CommonDropDownListView()
}
