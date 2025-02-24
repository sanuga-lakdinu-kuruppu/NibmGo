import SwiftUI

struct AvailabilityCardButtonView: View {
    var text: String
    var backgroundColor: Color = .blue
    var body: some View {
        Text(text)
            .font(.callout)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .background(backgroundColor.gradient)
            .cornerRadius(50)
    }
}

#Preview {
    AvailabilityCardButtonView(text: "High", backgroundColor: .red)
}
