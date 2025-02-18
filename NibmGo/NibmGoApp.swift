import SwiftUI

@main
struct NibmGoApp: App {
    @StateObject var globalRouter = NavigationRouter()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $globalRouter.pathOutside) {
                SplashView()
                    .navigationDestination(for: String.self) { destination in
                        if destination == "Login" {
                            LoginView()
                        } else if destination == "ForgotPasswordVerifyEmail" {
                            ForgotPasswordVerifyEmailView()
                        }
                    }
            }
            .accentColor(Color("brandColor"))

        }
        .environmentObject(globalRouter)
    }
}
