import SwiftUI

struct HyperLinkTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.callout)
            .fontWeight(.medium)
            .underline()
            .foregroundColor(Color("brandColor"))
    }
}

#Preview {
    HyperLinkTextView(text: "Sample")
}
