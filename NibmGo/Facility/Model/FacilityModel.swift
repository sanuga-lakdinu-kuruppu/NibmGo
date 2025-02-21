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
    var availability: AvailabilityType
    var crowdLevel: CrowdLevelType
}
