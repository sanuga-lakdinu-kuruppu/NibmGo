import SwiftUI

@main
struct NibmGoApp: App {
    @StateObject var globalRouter = NavigationRouter()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $globalRouter.paths) {
                SplashView()
                    .navigationDestination(for: String.self) { destination in
                        if destination == Route.login.rawValue {
                            LoginView()
                        } else if destination
                            == Route.forgotPasswordVerifyEmail.rawValue
                        {
                            ForgotPasswordVerifyEmailView()
                        } else if destination == Route.otpVerification.rawValue
                        {
                            OtpVerificationView()
                        } else if destination
                            == Route.forgotPasswordResetPassword.rawValue
                        {
                            ResetPasswordView()
                        } else if destination
                            == Route.home.rawValue
                        {
                            TabLandingView()
                        } else if destination == Route.registration.rawValue {
                            RegisterView()
                        } else if destination == Route.profileEdit.rawValue {
                            ProfileEditView()
                        } else if destination
                            == Route.profilePasswordReset.rawValue
                        {
                            ProfilePasswordResetView()
                        }
                    }
            }
            .accentColor(Color("brandColor"))

        }
        .environmentObject(globalRouter)
    }
}
