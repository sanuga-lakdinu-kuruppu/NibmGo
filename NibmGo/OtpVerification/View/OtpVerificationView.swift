import SwiftUI

struct OtpVerificationView: View {
    @EnvironmentObject var globalRouter: NavigationRouter
    @State var otp: [String] = Array(repeating: "", count: 4)
    @FocusState var focusedIndex: Int?
    @State var timer: Timer? = nil
    @State var timerValue: Int = 0

    var body: some View {
        ZStack {
            CommonBackgroundView()
            VStack(spacing: 16) {
                Image("otpVerification")
                HeadingTextView(text: "Otp Verification")
                    .padding(.top, 16)
                NormalTextView(
                    text:
                        "We've sent a 4 digit code to your entered university email '\(globalRouter.universityEmail)'",
                    multilineTextAlignment: .center
                )

                HStack {
                    ForEach(0..<4, id: \.self) { index in
                        OtpTextInputView(input: $otp[index])
                            .focused($focusedIndex, equals: index)
                            .onChange(of: otp[index]) { newValue in
                                if newValue.count > 1 {
                                    otp[index] = String(newValue.prefix(1))
                                }

                                if !newValue.isEmpty {
                                    focusedIndex = (index < 3) ? index + 1 : nil
                                }
                            }
                    }
                }

                Button {
                    if globalRouter.commingFrom
                        == Route.forgotPasswordVerifyEmail.rawValue
                    {
                        globalRouter.paths
                            .append(Route.forgotPasswordResetPassword.rawValue)
                    } else if globalRouter.commingFrom
                        == Route.registration.rawValue
                    {
                        globalRouter.paths
                            .append(
                                Route.home.rawValue
                            )
                    }
                } label: {
                    CommonButtonView(
                        buttonText: "Verify",
                        backgroundColor: Color("brandColor"),
                        foregroundColor: Color.white
                    )
                }
                HStack {
                    NormalTextView(text: "Request code again in")
                    if timerValue > 0 {
                        HighlightedTextView(text: "\(timerValue) s")
                    } else {
                        HyperLinkTextView(text: "retry")
                            .onTapGesture {
                                startTimer()
                            }
                    }

                }
            }
            .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
        }
        .onAppear {
            startTimer()
        }
    }

    func startTimer() {
        timerValue = timerValue != 0 ? timerValue : 120
        timer =
            Timer
            .scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                if timerValue > 0 {
                    timerValue -= 1
                } else {
                    stopTimer()
                }
            }
    }

    func stopTimer() {
        timer?.invalidate()
    }
}

#Preview {
    OtpVerificationView().environmentObject(NavigationRouter())
}
