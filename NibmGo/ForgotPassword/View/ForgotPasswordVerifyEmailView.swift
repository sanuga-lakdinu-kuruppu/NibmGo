//
//  ForgotPasswordVerifyEmailView.swift
//  NibmGo
//
//  Created by Sachin Gunawardena on 2025-02-18.
//

import SwiftUI

struct ForgotPasswordVerifyEmailView: View {
    @State var universityEmail: String = ""

    var body: some View {
        ZStack {
            CommonBackgroundView()
            VStack(spacing: 16) {
                Image("ForgotPasswordEmailVerify")
                HeadingTextView(text: "Forgot Password")
                    .padding(.top, 16)
                NormalTextView(text: "Don't worry! Please enter your university email.")

                CommonTextInputView(
                    hint: "University Email",
                    text: $universityEmail
                )


                Button {
                    print("Verify Email For Forgot Password Clicked")
                } label: {
                    CommonButtonView(
                        buttonText: "Verify Email",
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
    ForgotPasswordVerifyEmailView()
}
