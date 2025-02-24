import Charts
import SwiftUI

struct PeakHourChartView: View {
    var peakHours: [PeakHourModel]
    var body: some View {
        VStack {
            Chart {
                ForEach(peakHours) { hour in
                    BarMark(
                        x: .value("Hour", hour.hour),
                        y: .value("Availability", hour.availability)
                    )
                    .foregroundStyle(
                        getColorForTheBar(barValue: hour.availability).gradient
                    )
                    .cornerRadius(50)
                }
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: 4))
            }
        }
        .frame(height: 150)
        .padding(16)
        .background(.white)
        .cornerRadius(15)
    }

    private func getColorForTheBar(barValue: Double) -> Color {
        if barValue <= 75 {
            return Color.green
        } else if barValue <= 90 {
            return Color.orange
        } else {
            return Color.red
        }
    }
}

#Preview {
    let peakHours: [PeakHourModel] = [
        .init(hour: 0, availability: 0.0),
        .init(hour: 1, availability: 0.0),
        .init(hour: 2, availability: 0.0),
        .init(hour: 3, availability: 0.0),
        .init(hour: 4, availability: 0.0),
        .init(hour: 5, availability: 0.0),
        .init(hour: 6, availability: 0.0),
        .init(hour: 7, availability: 0.0),
        .init(hour: 8, availability: 0.0),
        .init(hour: 9, availability: 55.0),
        .init(hour: 10, availability: 60.0),
        .init(hour: 11, availability: 70.0),
        .init(hour: 12, availability: 75.0),
        .init(hour: 13, availability: 80.0),
        .init(hour: 14, availability: 85.0),
        .init(hour: 15, availability: 90.0),
        .init(hour: 16, availability: 95.0),
        .init(hour: 17, availability: 85.0),
        .init(hour: 18, availability: 0.0),
        .init(hour: 19, availability: 0.0),
        .init(hour: 20, availability: 0.0),
        .init(hour: 21, availability: 0.0),
        .init(hour: 22, availability: 0.0),
        .init(hour: 23, availability: 0.0),
    ]
    PeakHourChartView(peakHours: peakHours)
}
