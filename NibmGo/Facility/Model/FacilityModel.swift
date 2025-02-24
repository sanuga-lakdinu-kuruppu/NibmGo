import SwiftUI

struct FacilityModel: Identifiable {
    var id: UUID = UUID()
    var facilityId: Int
    var name: String
    var type: FacilityType
    var longitude: Double
    var latitude: Double
    var address: String
    var imageUrls: [String]?
    var availabilityInDouble: Double
    var availabilityInString: AvailabilityType
    var isPinned: Bool = false
    var isSubscribed: Bool = false
    var peakHours: [PeakHourModel] = [
        .init(hour: 0, availability: 0.0),
        .init(hour: 1, availability: 0.0),
        .init(hour: 2, availability: 0.0),
        .init(hour: 3, availability: 0.0),
        .init(hour: 4, availability: 0.0),
        .init(hour: 5, availability: 0.0),
        .init(hour: 6, availability: 0.0),
        .init(hour: 7, availability: Double.random(in: 0...20)),
        .init(hour: 8, availability: Double.random(in: 0...30)),
        .init(hour: 9, availability: Double.random(in: 0...100)),
        .init(hour: 10, availability: Double.random(in: 0...100)),
        .init(hour: 11, availability: Double.random(in: 0...100)),
        .init(hour: 12, availability: Double.random(in: 0...100)),
        .init(hour: 13, availability: Double.random(in: 0...100)),
        .init(hour: 14, availability: Double.random(in: 0...100)),
        .init(hour: 15, availability: Double.random(in: 0...100)),
        .init(hour: 16, availability: Double.random(in: 0...100)),
        .init(hour: 17, availability: Double.random(in: 0...100)),
        .init(hour: 18, availability: Double.random(in: 0...40)),
        .init(hour: 19, availability: Double.random(in: 0...20)),
        .init(hour: 20, availability: 0.0),
        .init(hour: 21, availability: 0.0),
        .init(hour: 22, availability: 0.0),
        .init(hour: 23, availability: 0.0),
    ]
}

struct PeakHourModel: Identifiable {
    var id: UUID = UUID()
    var hour: Int
    var availability: Double
}
