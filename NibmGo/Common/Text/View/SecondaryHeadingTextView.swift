import SwiftUI

struct SecondaryHeadingTextView: View {
    var text: String
    var foregroundColor: Color = Color.black
    var body: some View {
        Text(text)
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(foregroundColor)
    }
}

#Preview {
    SecondaryHeadingTextView(text: "jfklasd")
}
