import SwiftUI

struct NormalTextView: View {
    var text: String
    var multilineTextAlignment: TextAlignment = .leading
    var foregroundColor: Color = Color("commonTextColor")
    var body: some View {
        Text(text)
            .font(.callout)
            .fontWeight(.medium)
            .foregroundColor(foregroundColor)
            .multilineTextAlignment(multilineTextAlignment)
    }
}

#Preview {
    NormalTextView(text: "Sample text")
}
