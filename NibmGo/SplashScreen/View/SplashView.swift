import SwiftUI

struct SplashView: View {
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
    }
}

#Preview {
    SplashView()
}
