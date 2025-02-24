import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var globalRouter: NavigationRouter
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var universityEmail: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        ZStack {
            CommonBackgroundView()
            
            VStack(spacing: 16) {

                Image("register")
                HeadingTextView(text: "Sign Up")
                    .padding(.top, 16)

                NormalTextView(
                    text: "Create your account using the provided university email.",
                    multilineTextAlignment: .center
                )
                
                CommonTextInputView(hint: "First name", text: $firstName)
                
                CommonTextInputView(hint: "Last name", text: $lastName)

                CommonTextInputView(hint: "University Email", text: $universityEmail)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                CommonPasswordInputView(hint: "Password", password: $password)
                
                CommonPasswordInputView(hint: "Confirm Password", password: $confirmPassword)
                
                NormalTextView(
                    text: "Your password must be at least 8 characters, include a number, an uppercase letter, a lowercase letter, and a special character.",
                    multilineTextAlignment: .center
                )
                
                Button(action: {
                    globalRouter.paths.append(Route.login.rawValue)
                }) {
                    CommonButtonView(
                        buttonText: "Sign Up",
                        backgroundColor: Color("brandColor"),
                        foregroundColor: Color.white
                    )
                }
            }
            .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
        }
    }
}

#Preview {
    RegisterView()
}
