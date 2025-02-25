import SwiftUI

struct NormalTextView: View {
    var text: String
    var multilineTextAlignment: TextAlignment = .leading
    var foregroundColor: Color = Color("commonTextColor")
    var weight: Font.Weight = .medium
    var body: some View {
        Text(text)
            .font(.callout)
            .fontWeight(weight)
            .foregroundColor(foregroundColor)
            .multilineTextAlignment(multilineTextAlignment)
    }
}

#Preview {
    NormalTextView(text: "Sample text")
}
