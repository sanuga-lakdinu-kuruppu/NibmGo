import SwiftUI

struct OtpVerificationView: View {
    @EnvironmentObject var globalRouter: NavigationRouter
    @State var otp: [String] = Array(repeating: "", count: 4)
    @FocusState var focusedIndex: Int?

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
                        print("Comming from forgot password \(otp.joined())")
                        globalRouter.pathOutside
                            .append(Route.forgotPasswordResetPassword.rawValue)
                    } else if globalRouter.commingFrom
                        == Route.registration.rawValue
                    {
                        print("Comming from registration")
                    }
                } label: {
                    CommonButtonView(
                        buttonText: "Verify",
                        backgroundColor: Color("brandColor"),
                        foregroundColor: Color.white
                    )
                }
                HStack {
                    NormalTextView(text: "Request code again in ")
                }
            }
            .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
        }
    }
}

#Preview {
    OtpVerificationView().environmentObject(NavigationRouter())
}
