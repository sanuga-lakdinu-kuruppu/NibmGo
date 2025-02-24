import SwiftUI

class FacilityViewModel {
    static let shared = FacilityViewModel()
    private init() {}
    func getAllFacilities() -> [FacilityModel] {
        let facilities = [
            FacilityModel(
                facilityId: 1, name: "California Hall", type: .lectureHall,
                longitude: -122.26032259113008,
                latitude: 37.87185385379638,
                address: "University of California, Berkeley.",
                imageUrls: [
                    "https://dac.berkeley.edu/sites/default/files/styles/panopoly_image_spotlight/public/california-building-1_0.jpg?itok=gWM_ZgCh",
                    "https://www.usgbc.org/sites/default/files/2020-10/bcjcalifornia_hall2433.jpg",
                    "https://upload.wikimedia.org/wikipedia/commons/3/3c/California_Hall.JPG",
                    "https://www.bcj.com/wp-content/uploads/2020/10/BCJ-California_Hall-2322a_medium.jpg",
                    "https://www.ucdavis.edu/sites/default/files/news/campus-news/2018/dec/califhall5-filling-up-925.jpg",
                    "https://dac.berkeley.edu/sites/default/files/styles/panopoly_image_spotlight/public/buildings-1_0/buildings-1/California-Building.jpg?itok=EOU4Q-j7",
                ], availabilityInDouble: 34.0,
                availabilityInString: .low, isPinned: true, isSubscribed: true),
            FacilityModel(
                facilityId: 2, name: "Doe Library", type: .library,
                longitude: -122.25924194010149,
                latitude: 37.87226759580837,
                address: "University of California, Berkeley.",
                imageUrls: [
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyeBiCFRcYidhNIuAIGIqX8isJjHA2SGc_zw&s",
                    "https://www.lib.berkeley.edu/sites/default/files/inline-images/doehours-00835.jpg",
                    "https://life.berkeley.edu/wp-content/uploads/2024/10/north_room-Editedjpg.jpg",
                    "https://storage.googleapis.com/campaign-identity/images/LanguageHero_iqyLsU9.2e16d0ba.fill-960x500_uj4qtW2.jpg",
                ], availabilityInDouble: 56.0,
                availabilityInString: .low),
            FacilityModel(
                facilityId: 3, name: "Durant Hall", type: .lectureHall,
                longitude: -122.26010024695167,
                latitude: 37.87135715736398,
                address: "University of California, Berkeley.",
                imageUrls: [
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMTZoJbZTSUJmwbMzbXKQlIQKe9Bl9-Q_62w&s",
                    "https://live.staticflickr.com/1940/44744299815_671f0bfa9e_b.jpg",
                    "https://newsarchive.berkeley.edu/news/media/releases/2008/10/images/durant.jpg",
                    "https://www.architecturalrecord.com/ext/resources/archives/projects/Building_types_study/universities/2011/images/Durant-Hall-4.jpg",
                    "https://www.architecturalrecord.com/ext/resources/archives/projects/Building_types_study/universities/2011/images/Durant-Hall-1.jpg?t=1453816081&width=696",
                ], availabilityInDouble: 93.0,
                availabilityInString: .high, isPinned: true, isSubscribed: true),
            FacilityModel(
                facilityId: 4, name: "Edwards Stadium", type: .stadium,
                longitude: -122.26486417157663,
                latitude: 37.86906470198154,
                address: "University of California, Berkeley.",
                imageUrls: [
                    "https://s3-media0.fl.yelpcdn.com/bphoto/ktJbq4vZrBjgWHYy9b_RSg/348s.jpg",
                    "https://arc-anglerfish-arc2-prod-sltrib.s3.amazonaws.com/public/FIJTRG6RI5AGZEQ3SBZK5D7CYE.jpg",
                ], availabilityInDouble: 90.0,
                availabilityInString: .high),
            FacilityModel(
                facilityId: 5, name: "California Hall", type: .lectureHall,
                longitude: -122.26032259113008,
                latitude: 37.87185385379638,
                address: "University of California, Berkeley.",
                imageUrls: [
                    "https://dac.berkeley.edu/sites/default/files/styles/panopoly_image_spotlight/public/california-building-1_0.jpg?itok=gWM_ZgCh",
                    "https://www.usgbc.org/sites/default/files/2020-10/bcjcalifornia_hall2433.jpg",
                    "https://upload.wikimedia.org/wikipedia/commons/3/3c/California_Hall.JPG",
                    "https://www.bcj.com/wp-content/uploads/2020/10/BCJ-California_Hall-2322a_medium.jpg",
                    "https://www.ucdavis.edu/sites/default/files/news/campus-news/2018/dec/califhall5-filling-up-925.jpg",
                    "https://dac.berkeley.edu/sites/default/files/styles/panopoly_image_spotlight/public/buildings-1_0/buildings-1/California-Building.jpg?itok=EOU4Q-j7",
                ], availabilityInDouble: 34.0,
                availabilityInString: .low, isPinned: true, isSubscribed: true),
            FacilityModel(
                facilityId: 6, name: "Doe Library", type: .library,
                longitude: -122.25924194010149,
                latitude: 37.87226759580837,
                address: "University of California, Berkeley.",
                imageUrls: [
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyeBiCFRcYidhNIuAIGIqX8isJjHA2SGc_zw&s",
                    "https://www.lib.berkeley.edu/sites/default/files/inline-images/doehours-00835.jpg",
                    "https://life.berkeley.edu/wp-content/uploads/2024/10/north_room-Editedjpg.jpg",
                    "https://storage.googleapis.com/campaign-identity/images/LanguageHero_iqyLsU9.2e16d0ba.fill-960x500_uj4qtW2.jpg",
                ], availabilityInDouble: 34.0,
                availabilityInString: .low, isPinned: true, isSubscribed: true),
            FacilityModel(
                facilityId: 7, name: "Durant Hall", type: .lectureHall,
                longitude: -122.26010024695167,
                latitude: 37.87135715736398,
                address: "University of California, Berkeley.",
                imageUrls: [
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMTZoJbZTSUJmwbMzbXKQlIQKe9Bl9-Q_62w&s",
                    "https://live.staticflickr.com/1940/44744299815_671f0bfa9e_b.jpg",
                    "https://newsarchive.berkeley.edu/news/media/releases/2008/10/images/durant.jpg",
                    "https://www.architecturalrecord.com/ext/resources/archives/projects/Building_types_study/universities/2011/images/Durant-Hall-4.jpg",
                    "https://www.architecturalrecord.com/ext/resources/archives/projects/Building_types_study/universities/2011/images/Durant-Hall-1.jpg?t=1453816081&width=696",
                ], availabilityInDouble: 99.0,
                availabilityInString: .high),
            FacilityModel(
                facilityId: 8, name: "Edwards Stadium", type: .stadium,
                longitude: -122.26486417157663,
                latitude: 37.86906470198154,
                address: "University of California, Berkeley.",
                imageUrls: [
                    "https://s3-media0.fl.yelpcdn.com/bphoto/ktJbq4vZrBjgWHYy9b_RSg/348s.jpg",
                    "https://arc-anglerfish-arc2-prod-sltrib.s3.amazonaws.com/public/FIJTRG6RI5AGZEQ3SBZK5D7CYE.jpg",
                ], availabilityInDouble: 77.0,
                availabilityInString: .moderate),
            FacilityModel(
                facilityId: 9, name: "California Hall", type: .lectureHall,
                longitude: -122.26032259113008,
                latitude: 37.87185385379638,
                address: "University of California, Berkeley.",
                imageUrls: [
                    "https://dac.berkeley.edu/sites/default/files/styles/panopoly_image_spotlight/public/california-building-1_0.jpg?itok=gWM_ZgCh",
                    "https://www.usgbc.org/sites/default/files/2020-10/bcjcalifornia_hall2433.jpg",
                    "https://upload.wikimedia.org/wikipedia/commons/3/3c/California_Hall.JPG",
                    "https://www.bcj.com/wp-content/uploads/2020/10/BCJ-California_Hall-2322a_medium.jpg",
                    "https://www.ucdavis.edu/sites/default/files/news/campus-news/2018/dec/califhall5-filling-up-925.jpg",
                    "https://dac.berkeley.edu/sites/default/files/styles/panopoly_image_spotlight/public/buildings-1_0/buildings-1/California-Building.jpg?itok=EOU4Q-j7",
                ], availabilityInDouble: 34.0,
                availabilityInString: .low, isPinned: true, isSubscribed: true),
            FacilityModel(
                facilityId: 10, name: "Doe Library", type: .library,
                longitude: -122.25924194010149,
                latitude: 37.87226759580837,
                address: "University of California, Berkeley.",
                imageUrls: [
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyeBiCFRcYidhNIuAIGIqX8isJjHA2SGc_zw&s",
                    "https://www.lib.berkeley.edu/sites/default/files/inline-images/doehours-00835.jpg",
                    "https://life.berkeley.edu/wp-content/uploads/2024/10/north_room-Editedjpg.jpg",
                    "https://storage.googleapis.com/campaign-identity/images/LanguageHero_iqyLsU9.2e16d0ba.fill-960x500_uj4qtW2.jpg",
                ], availabilityInDouble: 34.0,
                availabilityInString: .low),
            FacilityModel(
                facilityId: 11, name: "Durant Hall", type: .lectureHall,
                longitude: -122.26010024695167,
                latitude: 37.87135715736398,
                address: "University of California, Berkeley.",
                imageUrls: [
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMTZoJbZTSUJmwbMzbXKQlIQKe9Bl9-Q_62w&s",
                    "https://live.staticflickr.com/1940/44744299815_671f0bfa9e_b.jpg",
                    "https://newsarchive.berkeley.edu/news/media/releases/2008/10/images/durant.jpg",
                    "https://www.architecturalrecord.com/ext/resources/archives/projects/Building_types_study/universities/2011/images/Durant-Hall-4.jpg",
                    "https://www.architecturalrecord.com/ext/resources/archives/projects/Building_types_study/universities/2011/images/Durant-Hall-1.jpg?t=1453816081&width=696",
                ], availabilityInDouble: 92.0,
                availabilityInString: .high),
            FacilityModel(
                facilityId: 12, name: "Edwards Stadium", type: .stadium,
                longitude: -122.26486417157663,
                latitude: 37.86906470198154,
                address: "University of California, Berkeley.",
                imageUrls: [
                    "https://s3-media0.fl.yelpcdn.com/bphoto/ktJbq4vZrBjgWHYy9b_RSg/348s.jpg",
                    "https://arc-anglerfish-arc2-prod-sltrib.s3.amazonaws.com/public/FIJTRG6RI5AGZEQ3SBZK5D7CYE.jpg",
                ], availabilityInDouble: 34.0,
                availabilityInString: .low, isPinned: true, isSubscribed: true),
            FacilityModel(
                facilityId: 13, name: "California Hall", type: .lectureHall,
                longitude: -122.26032259113008,
                latitude: 37.87185385379638,
                address: "University of California, Berkeley.",
                imageUrls: [
                    "https://dac.berkeley.edu/sites/default/files/styles/panopoly_image_spotlight/public/california-building-1_0.jpg?itok=gWM_ZgCh",
                    "https://www.usgbc.org/sites/default/files/2020-10/bcjcalifornia_hall2433.jpg",
                    "https://upload.wikimedia.org/wikipedia/commons/3/3c/California_Hall.JPG",
                    "https://www.bcj.com/wp-content/uploads/2020/10/BCJ-California_Hall-2322a_medium.jpg",
                    "https://www.ucdavis.edu/sites/default/files/news/campus-news/2018/dec/califhall5-filling-up-925.jpg",
                    "https://dac.berkeley.edu/sites/default/files/styles/panopoly_image_spotlight/public/buildings-1_0/buildings-1/California-Building.jpg?itok=EOU4Q-j7",
                ], availabilityInDouble: 88.0,
                availabilityInString: .moderate),
            FacilityModel(
                facilityId: 14, name: "Doe Library", type: .library,
                longitude: -122.25924194010149,
                latitude: 37.87226759580837,
                address: "University of California, Berkeley.",
                imageUrls: [
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyeBiCFRcYidhNIuAIGIqX8isJjHA2SGc_zw&s",
                    "https://www.lib.berkeley.edu/sites/default/files/inline-images/doehours-00835.jpg",
                    "https://life.berkeley.edu/wp-content/uploads/2024/10/north_room-Editedjpg.jpg",
                    "https://storage.googleapis.com/campaign-identity/images/LanguageHero_iqyLsU9.2e16d0ba.fill-960x500_uj4qtW2.jpg",
                ], availabilityInDouble: 32.9,
                availabilityInString: .low),
            FacilityModel(
                facilityId: 15, name: "Durant Hall", type: .lectureHall,
                longitude: -122.26010024695167,
                latitude: 37.87135715736398,
                address: "University of California, Berkeley.",
                imageUrls: [
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMTZoJbZTSUJmwbMzbXKQlIQKe9Bl9-Q_62w&s",
                    "https://live.staticflickr.com/1940/44744299815_671f0bfa9e_b.jpg",
                    "https://newsarchive.berkeley.edu/news/media/releases/2008/10/images/durant.jpg",
                    "https://www.architecturalrecord.com/ext/resources/archives/projects/Building_types_study/universities/2011/images/Durant-Hall-4.jpg",
                    "https://www.architecturalrecord.com/ext/resources/archives/projects/Building_types_study/universities/2011/images/Durant-Hall-1.jpg?t=1453816081&width=696",
                ], availabilityInDouble: 34.0,
                availabilityInString: .low, isPinned: true, isSubscribed: true),
            FacilityModel(
                facilityId: 16, name: "Edwards Stadium", type: .stadium,
                longitude: -122.26486417157663,
                latitude: 37.86906470198154,
                address: "University of California, Berkeley.",
                imageUrls: [
                    "https://s3-media0.fl.yelpcdn.com/bphoto/ktJbq4vZrBjgWHYy9b_RSg/348s.jpg",
                    "https://arc-anglerfish-arc2-prod-sltrib.s3.amazonaws.com/public/FIJTRG6RI5AGZEQ3SBZK5D7CYE.jpg",
                ], availabilityInDouble: 97.0,
                availabilityInString: .high, isPinned: true, isSubscribed: true),
            FacilityModel(
                facilityId: 17, name: "California Hall", type: .lectureHall,
                longitude: -122.26032259113008,
                latitude: 37.87185385379638,
                address: "University of California, Berkeley.",
                imageUrls: [
                    "https://dac.berkeley.edu/sites/default/files/styles/panopoly_image_spotlight/public/california-building-1_0.jpg?itok=gWM_ZgCh",
                    "https://www.usgbc.org/sites/default/files/2020-10/bcjcalifornia_hall2433.jpg",
                    "https://upload.wikimedia.org/wikipedia/commons/3/3c/California_Hall.JPG",
                    "https://www.bcj.com/wp-content/uploads/2020/10/BCJ-California_Hall-2322a_medium.jpg",
                    "https://www.ucdavis.edu/sites/default/files/news/campus-news/2018/dec/califhall5-filling-up-925.jpg",
                    "https://dac.berkeley.edu/sites/default/files/styles/panopoly_image_spotlight/public/buildings-1_0/buildings-1/California-Building.jpg?itok=EOU4Q-j7",
                ], availabilityInDouble: 84.0,
                availabilityInString: .moderate),
            FacilityModel(
                facilityId: 18, name: "Doe Library", type: .library,
                longitude: -122.25924194010149,
                latitude: 37.87226759580837,
                address: "University of California, Berkeley.",
                imageUrls: [
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyeBiCFRcYidhNIuAIGIqX8isJjHA2SGc_zw&s",
                    "https://www.lib.berkeley.edu/sites/default/files/inline-images/doehours-00835.jpg",
                    "https://life.berkeley.edu/wp-content/uploads/2024/10/north_room-Editedjpg.jpg",
                    "https://storage.googleapis.com/campaign-identity/images/LanguageHero_iqyLsU9.2e16d0ba.fill-960x500_uj4qtW2.jpg",
                ], availabilityInDouble: 12.0,
                availabilityInString: .low, isPinned: true, isSubscribed: true),
            FacilityModel(
                facilityId: 19, name: "Durant Hall", type: .lectureHall,
                longitude: -122.26010024695167,
                latitude: 37.87135715736398,
                address: "University of California, Berkeley.",
                imageUrls: [
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMTZoJbZTSUJmwbMzbXKQlIQKe9Bl9-Q_62w&s",
                    "https://live.staticflickr.com/1940/44744299815_671f0bfa9e_b.jpg",
                    "https://newsarchive.berkeley.edu/news/media/releases/2008/10/images/durant.jpg",
                    "https://www.architecturalrecord.com/ext/resources/archives/projects/Building_types_study/universities/2011/images/Durant-Hall-4.jpg",
                    "https://www.architecturalrecord.com/ext/resources/archives/projects/Building_types_study/universities/2011/images/Durant-Hall-1.jpg?t=1453816081&width=696",
                ], availabilityInDouble: 77.0,
                availabilityInString: .moderate),
            FacilityModel(
                facilityId: 20, name: "Edwards Stadium", type: .stadium,
                longitude: -122.26486417157663,
                latitude: 37.86906470198154,
                address: "University of California, Berkeley.",
                imageUrls: [
                    "https://s3-media0.fl.yelpcdn.com/bphoto/ktJbq4vZrBjgWHYy9b_RSg/348s.jpg",
                    "https://arc-anglerfish-arc2-prod-sltrib.s3.amazonaws.com/public/FIJTRG6RI5AGZEQ3SBZK5D7CYE.jpg",
                ], availabilityInDouble: 34.0,
                availabilityInString: .low, isSubscribed: true),

        ]
        return facilities
    }
}
