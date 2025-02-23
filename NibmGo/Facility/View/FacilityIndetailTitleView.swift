import SwiftUI

struct FacilityIndetailTitleView: View {
    var name: String
    var address: String
    var body: some View {
        VStack(spacing: 4) {
            HStack {
                SecondaryHeadingTextView(
                    text: name,
                    foregroundColor: .white
                )
                Spacer()
            }
            HStack {
                NormalTextView(
                    text: address,
                    multilineTextAlignment: .leading,
                    foregroundColor: .white
                )
                Spacer()
            }
        }
    }
}

#Preview {
    FacilityIndetailTitleView(name: "fjasdl", address: "fsjkdl")
}
