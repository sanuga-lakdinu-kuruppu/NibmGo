import SwiftUI

struct LoginView: View {
    @State var universityEmail: String = ""
    @State var password: String = ""

    var body: some View {
        ZStack {
            CommonBackgroundView()
            VStack(spacing: 16) {
                Image("logo")
                HeadingTextView(text: "Sign In")
                    .padding(.top, 16)
                NormalTextView(text: "Access to your account")

                CommonTextInputView(
                    hint: "University Email",
                    text: $universityEmail
                )

                CommonPasswordInputView(hint: "Password", password: $password)

                HStack {
                    Spacer()
                    HyperLinkTextView(text: "Forgot password?")
                        .onTapGesture {
                            print("Forgot password clicked ?")
                        }
                }

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
                    print("Guest Mode clicked")
                } label: {
                    CommonButtonView(
                        buttonText: "Guest Mode",
                        backgroundColor: Color("inputBackground"),
                        foregroundColor: Color("brandColor")
                    )
                }

            }
            .padding(.horizontal, UIScreen.main.bounds.width * 0.05)

            VStack {
                Spacer()
                HStack {
                    NormalTextView(text: "Not a member?")
                    HyperLinkTextView(text: "Register now")
                        .onTapGesture {
                            print("Register now clicked?")
                        }
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
