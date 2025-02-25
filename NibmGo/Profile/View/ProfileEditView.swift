

import SwiftUI

struct ProfileEditView: View {
    @EnvironmentObject var globalRouter: NavigationRouter

    @State private var user: UserProfileModel = ProfileViewModel.shared
        .getUserProfile()

    var body: some View {
        ZStack {
            CommonBackgroundView()
            ScrollView {
                VStack() {
                    HStack {
                        TitleTextView(text: user.shortName)
                        Spacer()
                        HyperLinkTextView(text: "Done")
                            .onTapGesture {
                            }
                    }
                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)

                    List {
                        Section {
                            CommonStaticListView(
                                icon: "", titleText: "First Name",
                                valueText: user.firstName)
                            CommonStaticListView(
                                icon: "", titleText: "Last Name",
                                valueText: user.lastName)
                        }

                    }
                    .contentMargins(.vertical, 0)
                    .frame(height: UIScreen.main.bounds.height * 1)



                }
                .padding(.top, 32)
            }
        }
    }

}

#Preview {
    ProfileEditView()
}
