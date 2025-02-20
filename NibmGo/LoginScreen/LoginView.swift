import SwiftUI

struct LoginView: View {
    @EnvironmentObject var globalRouter: NavigationRouter
    @State var universityEmail: String = ""
    @State var password: String = ""

    var body: some View {
        ZStack {
            CommonBackgroundView()
            VStack(spacing: 16) {
                Image("logo")
                HeadingTextView(text: "Sign In")
                    .padding(.top, 16)
                NormalTextView(
                    text: "Access to your account",
                    multilineTextAlignment: .center
                )

                CommonTextInputView(
                    hint: "University Email",
                    text: $universityEmail
                )

                CommonPasswordInputView(
                    hint: "Password", password: $password)

                HStack {
                    Spacer()
                    HyperLinkTextView(text: "Forgot password?")
                        .onTapGesture {
                            globalRouter.pathOutside
                                .append(
                                    Route.forgotPasswordVerifyEmail.rawValue
                                )
                        }
                }

                Button {
                    print("Sign In button clicked")
                    globalRouter.pathOutside
                        .append(
                            Route.home.rawValue
                        )
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
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoginView().environmentObject(NavigationRouter())
}
