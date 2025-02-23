import SwiftUI

struct FacilityIndetailImageView: View {
    var imageUrl: String?
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
                            * 0.5
                    )
                    .clipped()
            } else {
                ProgressView()
                    .frame(
                        height: UIScreen.main.bounds.height
                            * 0.5)
            }
        }
    }
}

#Preview {
    FacilityIndetailImageView()
}
