import SwiftUI

@main
struct NibmGoApp: App {
    @StateObject var globalDto = GlobalDto.shared

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $globalDto.paths) {
                LoginView()
                    .navigationDestination(for: String.self) {
                        destination in
                        if destination == Route.login.rawValue {
                            LoginView()
                        } else if destination
                            == Route.forgotPasswordVerifyEmail.rawValue
                        {
                            ForgotPasswordVerifyEmailView()
                        } else if destination
                            == Route.otpVerification.rawValue
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
                        } else if destination
                            == Route.notification.rawValue
                        {
                            NotificationView()
                        } else if destination
                            == Route.event.rawValue
                        {
                            if let event = globalDto.selectedEvent {
                                EventView(selectedEvent: event)
                            }
                        } else if destination
                            == Route.facility.rawValue
                        {
                            if let facility = globalDto.selectedFacility {
                                FacilityView(selectedFacility: facility)
                            }
                        } else if destination
                            == Route.map.rawValue
                        {
                            if let facility = globalDto.selectedFacility {
                                MapView(selectedFacility: facility)
                            }
                        }
                    }
            }
            .accentColor(Color("brandColor"))

        }
        .environmentObject(globalDto)
    }
}
