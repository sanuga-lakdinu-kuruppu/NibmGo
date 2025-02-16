import SwiftUI

struct CommonTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundColor(Color("commonTextColor"))
    }
}

#Preview {
    CommonTextView(text: "Sample Text")
}
