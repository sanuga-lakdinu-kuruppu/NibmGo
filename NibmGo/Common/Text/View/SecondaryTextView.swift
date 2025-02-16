import SwiftUI

struct SecondaryTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.caption)
            .fontWeight(.semibold)
    }
}

#Preview {
    SecondaryTextView(text: "Sample")
}
