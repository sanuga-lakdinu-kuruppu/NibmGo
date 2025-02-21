import SwiftUI

struct SecondaryHeadingTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(Color.black)
    }
}

#Preview {
    SecondaryHeadingTextView(text: "jfklasd")
}
