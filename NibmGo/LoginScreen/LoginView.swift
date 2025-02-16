import SwiftUI

struct LoginView: View {
    @State var universityEmail: String = ""
    var body: some View {
        ZStack {
            CommonBackgroundView()
            VStack {
                Image("logo")
                HeadingTextView(text: "Sign In")
                    .padding(.top, 16)
                NormalTextView(text: "Access to your account")
                TextField("University Email", text: $universityEmail)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("inputBackground"))
                    .cornerRadius(15)
                TextField("Password", text: $universityEmail)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("inputBackground"))
                    .cornerRadius(15)
                Button {
                    print("Sign In button clicked")
                } label: {
                    CommonButtonView(
                        buttonText: "Sign In",
                        backgroundColor: Color("brandColor"),
                        foregroundColor: Color.white
                    )
                }
                Button {
                    print("Sign In button clicked")
                } label: {
                    CommonButtonView(
                        buttonText: "Guest Mode",
                        backgroundColor: Color("inputBackground"),
                        foregroundColor: Color("brandColor")
                    )
                }
            }
            .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
        }
    }
}

#Preview {
    LoginView()
}
