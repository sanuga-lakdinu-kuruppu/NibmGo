
import SwiftUI

struct ProfilePasswordResetView: View {
    @EnvironmentObject var globalRouter: NavigationRouter

    @State private var user: UserProfileModel = ProfileViewModel.shared
        .getUserProfile()

    var body: some View {
        ZStack {
            CommonBackgroundView()
            
                VStack() {
                    HStack {
                        TitleTextView(text: "Password Reset")
                        Spacer()
                        HyperLinkTextView(text: "Reset")
                            .onTapGesture {
                            }
                    }
                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)

                    List {
                        Section {
                            CommonStaticListView(
                                icon: "", titleText: "Current Password",
                                valueText: "**************")
                            CommonStaticListView(
                                icon: "", titleText: "New Password",
                                valueText: "**************")
                            CommonStaticListView(
                                icon: "", titleText: "Confirm Password",
                                valueText: "**************")
                        }
                        Section(
                            footer: FootnoteTextView(text: "Your password must be at least 8 characters, include a number, an uppercase letter, a lowercase letter and a special character.")){}
                    }
                    .contentMargins(.vertical, 0)
   
                }
                .padding(.top, 32)
                
        }
    }

}

#Preview {
    ProfilePasswordResetView()
}
