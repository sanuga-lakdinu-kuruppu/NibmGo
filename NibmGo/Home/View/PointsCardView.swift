import SwiftUI

struct PointsCardView: View {
    var points: Int = 0
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "flag.pattern.checkered.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .frame(
                    width: UIScreen.main.bounds.width * 0.1,
                    height: UIScreen.main.bounds.width * 0.1
                )
                .padding(10)
            VStack(spacing: 8) {
                NormalTextView(
                    text: "You've Earned",
                    multilineTextAlignment: .center,
                    foregroundColor: .white,
                    weight: .bold
                )
                TitleTextView(
                    text: "\(points)",
                    foregroundColor: .white
                )
            }
        }
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
        .background(Color("pointBackgroundColor"))
        .cornerRadius(15)
    }
}

#Preview {
    PointsCardView()
}
