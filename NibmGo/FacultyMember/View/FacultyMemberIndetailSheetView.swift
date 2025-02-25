import SwiftUI

struct FacultyMemberIndetailSheetView: View {

    @Binding var selectedFacultyMember: FacultyMemberModel?

    var body: some View {
        VStack {
            if let facultyMember = selectedFacultyMember {
                HStack {
                    SecondaryHeadingTextView(
                        text:
                            "\(facultyMember.title). \(facultyMember.lastName) \(facultyMember.firstName.prefix(1))"
                    )
                    Spacer()
                    HStack(spacing: 16) {
                        HyperLinkTextView(
                            text: facultyMember.isPinned
                                ? "Unpin" : "Pin"
                        )
                        .onTapGesture {

                        }
                        HyperLinkTextView(text: "Cancel")
                            .onTapGesture {
                                selectedFacultyMember = nil
                            }
                    }

                }.padding(.horizontal, UIScreen.main.bounds.width * 0.05)

                List {
                    Section {
                        CommonStaticListView(
                            icon: "", titleText: "Availability",
                            valueText: facultyMember.isAvailable
                                ? "Available" : "Unavailable",
                            valueColor: facultyMember.isAvailable
                                ? .green : .red)
                    }

                    Section {
                        CommonStaticListView(
                            icon: "", titleText: "Name",
                            valueText:
                                "\(facultyMember.firstName) \(facultyMember.lastName)"
                        )
                        CommonStaticListView(
                            icon: "", titleText: "Designation",
                            valueText: facultyMember.designation)
                        CommonStaticListView(
                            icon: "", titleText: "Department",
                            valueText: facultyMember.department)
                    }

                    Section {
                        CommonStaticListView(
                            icon: "", titleText: "Email",
                            valueText: facultyMember.email
                        )
                        CommonStaticListView(
                            icon: "", titleText: "Phone",
                            valueText: facultyMember.phone)
                        HStack {
                            NormalTextView(
                                text: "Contacts", foregroundColor: .black)
                            Spacer()
                            HStack(spacing: 16) {
                                if facultyMember.isWhatsapp {
                                    Button {
                                    } label: {
                                        ContactImageView(image: "logoWhatsApp")
                                    }
                                }

                                if facultyMember.isEmail {
                                    Button {
                                    } label: {
                                        ContactImageView(image: "logoGmail")
                                    }
                                }

                                if facultyMember.isCall {
                                    Button {
                                    } label: {
                                        ContactImageView(image: "logoCall")
                                    }
                                }

                            }
                        }
                        .padding(.vertical, 4)

                    }
                }
                .contentMargins(.vertical, 0)
            }
        }
        .padding(.top, 16)
        .background(Color("commonBackground"))
    }
}

#Preview {
    //    FacultyMemberIndetailSheetView()
}
