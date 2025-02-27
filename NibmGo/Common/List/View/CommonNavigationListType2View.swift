import SwiftUI

struct CommonNavigationListType2View: View {
    var icon: String
    var titleText: String
    var tagText: String
    var url: String = ""
    var size = 0.09
    var body: some View {
        HStack {
            if url.isEmpty {
                Image(systemName: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color("brandColor"))
                    .frame(
                        width: UIScreen.main.bounds.width * size,
                        height: UIScreen.main.bounds.width * size
                    )
                    .padding(.trailing, 8)
            } else {
                AsyncImage(url: URL(string: url)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(1, contentMode: .fill)
                            .frame(
                                width: UIScreen.main.bounds.width * size,
                                height: UIScreen.main.bounds.width * size
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
                                width: UIScreen.main.bounds.width * size,
                                height: UIScreen.main.bounds.width * size)
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
