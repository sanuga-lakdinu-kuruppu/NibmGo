import SwiftUI

struct AvailabilityCardView: View {
    var availabilityValueInDouble: Double = 0.0
    var availabilityValueInString: String = ""
    let maxValue: Double = 100.0
    let minValue: Double = 0.0
    @State private var animatedValue = 0.0

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                NormalTextView(
                    text: "Availability",
                    multilineTextAlignment: .leading
                )
                Spacer()
                NormalTextView(
                    text: availabilityValueInString,
                    multilineTextAlignment: .leading
                )
            }

            HStack {
                Gauge(
                    value: animatedValue,
                    in: minValue...maxValue
                ) {
                }
                .tint(getColorCode(value: availabilityValueInDouble).gradient)
            }

            HStack {
                Button {

                } label: {
                    AvailabilityCardButtonView(
                        text: "Low", backgroundColor: .green)
                }
                Button {

                } label: {
                    AvailabilityCardButtonView(
                        text: "Moderate", backgroundColor: .orange)
                }

                Button {

                } label: {
                    AvailabilityCardButtonView(
                        text: "High", backgroundColor: .red)
                }
            }

        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                animatedValue = availabilityValueInDouble
            }
        }
        .padding(16)
        .background(.white)
        .cornerRadius(15)
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
    AvailabilityCardView()
}
