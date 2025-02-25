import SwiftUI

struct FacilityAvailabilityGuageView: View {
    var availabilityInDouble: Double = 0.0
    var availabilityInString: String = ""
    let maxValue: Double = 100
    let minValue: Double = 0
    @State private var animatedValue = 0.0

    var body: some View {
        VStack {
            HStack {
                NormalTextView(
                    text: "Availability",
                    multilineTextAlignment: .leading
                )
                Spacer()
                NormalTextView(
                    text: availabilityInString,
                    multilineTextAlignment: .leading
                )
            }
            HStack {
                Gauge(
                    value: animatedValue,
                    in: minValue...maxValue
                ) {
                }
                .tint(getColorCode(value: availabilityInDouble).gradient)
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                animatedValue = availabilityInDouble
            }
        }
    }

    private func getColorCode(value: Double) -> Color {
        if value <= 75 {
            return .green
        } else if value <= 90 {
            return .orange
        } else {
            return .red
        }
    }
}

#Preview {
    FacilityAvailabilityGuageView()
}
