import SwiftUI

struct CommonNavigationListType2View: View {
    var icon: String
    var titleText: String
    var tagText: String
    var url: String = ""
    var body: some View {
        HStack {
            if url.isEmpty {
                Image(systemName: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color("brandColor"))
                    .frame(
                        width: UIScreen.main.bounds.width * 0.09,
                        height: UIScreen.main.bounds.width * 0.09
                    )
                    .padding(.trailing, 8)
            } else {
                AsyncImage(url: URL(string: url)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(1, contentMode: .fill)
                            .frame(
                                width: UIScreen.main.bounds.width * 0.09,
                                height: UIScreen.main.bounds.width * 0.09
                            )
                            .clipShape(
                                RoundedRectangle(
                                    cornerRadius: 10)
                            )
                            .clipped()
                            .padding(.trailing, 8)
                    } else {
                        ProgressView()
                            .frame(
                                width: UIScreen.main.bounds.width * 0.09,
                                height: UIScreen.main.bounds.width * 0.09)
                    }
                }
            }

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
