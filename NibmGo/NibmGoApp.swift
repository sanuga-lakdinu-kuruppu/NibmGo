import SwiftUI

@main
struct NibmGoApp: App {
    @StateObject var globalRouter = NavigationRouter()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $globalRouter.pathOutside) {
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
                        }
                    }
            }
            .accentColor(Color("brandColor"))

        }
        .environmentObject(globalRouter)
    }
}
