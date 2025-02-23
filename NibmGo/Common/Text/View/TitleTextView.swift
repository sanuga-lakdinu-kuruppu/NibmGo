import SwiftUI

struct TitleTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundColor(Color.black)
    }
}

#Preview {
    TitleTextView(text: "fajskdl")
}
