import SwiftUI

struct NormalTextView: View {
    var text: String
    var multilineTextAlignment: TextAlignment = .leading
    var body: some View {
        Text(text)
            .font(.callout)
            .fontWeight(.medium)
            .foregroundColor(Color("commonTextColor"))
            .multilineTextAlignment(multilineTextAlignment)
    }
}

#Preview {
    NormalTextView(text: "Sample text")
}
