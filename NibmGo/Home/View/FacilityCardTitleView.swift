import SwiftUI

struct FacilityCardTitleView: View {
    var facilityName: String
    var facilityAddress: String
    var body: some View {
        VStack(alignment: .leading) {
            NormalTextView(
                text: facilityName,
                multilineTextAlignment: .leading,
                foregroundColor: .black,
                weight: .bold
            )
            NormalTextView(
                text: facilityAddress,
                multilineTextAlignment: .leading,
                weight: .bold
            )
        }
    }
}

#Preview {
    FacilityCardTitleView(facilityName: "fjadskl", facilityAddress: "fjasdkl")
}
