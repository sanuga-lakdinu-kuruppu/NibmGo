import SwiftUI

struct FacilityIndetailImageView: View {
    var imageUrl: String?
    var imageSize: Double = 0.5
    var body: some View {
        AsyncImage(
            url: URL(
                string: imageUrl ?? "")
        ) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        width: UIScreen.main.bounds.width,
                        height: UIScreen.main.bounds.height
                            * imageSize
                    )
                    .clipped()
            } else {
                ProgressView()
                    .frame(
                        height: UIScreen.main.bounds.height
                            * imageSize)
            }
        }
    }
}

#Preview {
    FacilityIndetailImageView()
}
