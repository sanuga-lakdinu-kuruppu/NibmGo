import SwiftUI

struct CommonNavigationListType2View: View {
    var icon: String
    var titleText: String
    var tagText: String
    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color("brandColor"))
                .frame(
                    width: UIScreen.main.bounds.width * 0.09,
                    height: UIScreen.main.bounds.width * 0.09
                )
                .padding(.trailing, 8)
            VStack(alignment: .leading) {
                NormalTextView(
                    text: titleText, foregroundColor: .black)
                NormalTextView(text: tagText)
            }

            Spacer()
        }
    }
}

#Preview {
    CommonNavigationListType2View(
        icon: "person.crop.circle.fill", titleText: "Mr. T. Weerasinghe",
        tagText: "School Of Computing")
}
