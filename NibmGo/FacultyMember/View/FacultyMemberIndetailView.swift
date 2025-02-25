import SwiftUI

struct FacultyMemberIndetailView: View {
    @Binding var selectedFacultyMember: FacultyMember?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(selectedFacultyMember?.facultyName ?? "")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)

                Text(selectedFacultyMember?.designation ?? "")
                    .font(.title2)
                    .foregroundColor(.gray)

                Divider()

                HStack {
                    Text("Email: ")
                        .font(.headline)
                    Text(selectedFacultyMember?.email ?? "")
                        .foregroundColor(.blue)
                        .onTapGesture {
                            // Open email app
                            if let email = selectedFacultyMember?.email,
                               let url = URL(string: "mailto:\(email)") {
                                UIApplication.shared.open(url)
                            }
                        }
                }

                HStack {
                    Text("Phone: ")
                        .font(.headline)
                    Text(selectedFacultyMember?.phone ?? "")
                        .foregroundColor(.black)
                        .onTapGesture {
                            // Open phone dialer
                            if let phone = selectedFacultyMember?.phone,
                               let url = URL(string: "tel:\(phone)") {
                                UIApplication.shared.open(url)
                            }
                        }
                }

                Divider()

                VStack(alignment: .leading) {
                    if selectedFacultyMember?.isWhatsapp ?? false {
                        Text("Available on WhatsApp")
                            .font(.headline)
                            .foregroundColor(.green)
                    }
                    if selectedFacultyMember?.isAvailable ?? false {
                        Text("Available for contact")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                    if selectedFacultyMember?.isCall ?? false {
                        Text("Can be contacted by call")
                            .font(.headline)
                            .foregroundColor(.orange)
                    }
                }

                Spacer()
            }
            .padding()
            .navigationBarTitle("Faculty Member Details", displayMode: .inline)
        }
    }
}

struct FacultyMemberIndetailView_Previews: PreviewProvider {
    static var previews: some View {
        FacultyMemberIndetailView(selectedFacultyMember: .constant(FacultyMember(
            facultyName: "Dr. Weerasinghe",
            designation: "Head of School of Computing",
            email: "thisara@nibm.lk",
            phone: "+94 11 732 1000",
            isPinned: true,
            isAvailable: true,
            isWhatsapp: true,
            isEmail: true,
            isCall: true
        )))
    }
}
