import SwiftUI

struct AvailabilityToggleView: View {
    @Binding var isAvailable: Bool
    var body: some View {
        VStack(spacing: 8) {
            NormalTextView(
                text: "Available",
                multilineTextAlignment: .center,
                weight: .bold
            )
            Toggle("", isOn: $isAvailable)
                .labelsHidden()
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color("commonTextColor"), lineWidth: 1)
        )
    }
}

#Preview {
    //    AvailabilityToggleView()
}
