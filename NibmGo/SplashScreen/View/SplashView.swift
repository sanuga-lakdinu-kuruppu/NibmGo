import SwiftUI

struct SplashView: View {
    @State var isLoginNavigation: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                CommonBackgroundView()
                Image("logo")
                VStack {
                    Spacer()
                    FootnoteTextView(text: "All Rights Reserved")
                }
                .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
            }
            .navigationDestination(isPresented: $isLoginNavigation) {
                LoginView()
                    .navigationBarBackButtonHidden(true)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    self.isLoginNavigation.toggle()
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
