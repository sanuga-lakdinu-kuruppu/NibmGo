import SwiftUI

struct SplashView: View {
    @EnvironmentObject var globalRouter: NavigationRouter
    var body: some View {
        ZStack {
            CommonBackgroundView()
            Image("logo")
            VStack {
                Spacer()
                FootnoteTextView(text: "All Rights Reserved")
            }
            .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                globalRouter.paths.append(Route.login.rawValue)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SplashView().environmentObject(NavigationRouter())
}
