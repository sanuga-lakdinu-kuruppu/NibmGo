import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var globalRouter: NavigationRouter
    @State var isAvailable = true
    @State var selectedBranch = "Nibm - Colombo"
    @State var branches = [
        "Nibm - Colombo", "Nibm - Kandy", "Nibm - Galle",
    ]
    var valueColor: Color = Color("commonTextColor")

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                CommonStaticListView(
                    icon: "star.fill", titleText: "Points earned",
                    valueText: "14,250")
                Spacer()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)

            HStack {
                NormalTextView(
                    text: "Primary Branch", foregroundColor: .black)
                Spacer()
                Picker("Primary Branch", selection: $selectedBranch) {
                    ForEach(branches, id: \.self) { branch in
                        Text(branch)
                    }
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)

            HStack {
                NormalTextView(
                    text: "Availability", foregroundColor: .black)
                Spacer()
                Toggle("", isOn: $isAvailable)
                    .labelsHidden()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)

            VStack(spacing: 0) {
                HStack {
                    NormalTextView(
                        text: "First Name", foregroundColor: .black)
                    Spacer()
                    NormalTextView(text: "Himasha", foregroundColor: .gray)
                }
                .padding(.vertical, 8)
                Divider()
                HStack {
                    NormalTextView(
                        text: "Last Name", foregroundColor: .black)
                    Spacer()
                    NormalTextView(
                        text: "Weerasooriya", foregroundColor: .gray)
                }
                .padding(.vertical, 8)
                Divider()
                HStack {
                    NormalTextView(text: "Email", foregroundColor: .black)
                    Spacer()
                    NormalTextView(
                        text: "cobsccomp232p002@student.nibm.lk",
                        foregroundColor: .gray)
                }
                .padding(.vertical, 8)
                Divider()
                HStack {
                    NormalTextView(
                        text: "Joined At", foregroundColor: .black)
                    Spacer()
                    NormalTextView(
                        text: "27th of February 2025",
                        foregroundColor: .gray)
                }

                .padding(.vertical, 8)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)

            .padding(.bottom, 16)
            Button {
                print("Reset Password Clicked")
            } label: {
                CommonButtonView(
                    buttonText: "Reset Password",
                    backgroundColor: Color("inputBackground"),
                    foregroundColor: Color("brandColor")
                )
            }

            Button {
                print("Sign Out Clicked")
            } label: {
                CommonButtonView(
                    buttonText: "Sign Out",
                    backgroundColor: Color("inputBackground"),
                    foregroundColor: Color("brandColor")
                )
            }
            Spacer()

        }

        .padding()
        .background(Color(.systemGray6))
        .navigationBarTitle("Himasha, W.", displayMode: .inline)
        .navigationBarItems(trailing: Button("Edit") {})

    }

}

#Preview {
    ProfileView()
}
