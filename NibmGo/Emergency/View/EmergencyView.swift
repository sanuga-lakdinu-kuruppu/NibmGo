import SwiftUI

struct EmergencyContactsView: View {
    
    private let allContacts: [EmergencyContactModel] = [
        EmergencyContactModel(id: UUID(), name: "Security Office 1", phoneNumber: "+94117321000"),
        EmergencyContactModel(id: UUID(), name: "Security Office 2", phoneNumber: "+94117321001"),
        EmergencyContactModel(id: UUID(), name: "First Aid Station", phoneNumber: "+94117321005")
    ]

    var body: some View {
        ZStack {
            CommonBackgroundView()

            VStack {
             
                HStack {
                    TitleTextView(text: "Emergency Contacts")
                    Spacer()
                }
                .padding(.top, 32)
                .padding(.horizontal, UIScreen.main.bounds.width * 0.05)

           
                List(allContacts, id: \.id) { contact in
                    CommonNavigationListType2View(
                        icon: "phone.circle.fill", 
                        titleText: contact.name,
                        tagText: contact.phoneNumber
                    )
                }
                .contentMargins(.vertical, 0)
            }
        }
    }
}

#Preview {
    EmergencyContactsView()
}
