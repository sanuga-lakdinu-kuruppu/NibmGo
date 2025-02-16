import SwiftUI

struct NormalTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.callout)
            .fontWeight(.medium)
            .foregroundColor(Color("commonTextColor"))
    }
}

#Preview {
    NormalTextView(text: "Sample text")
}
