import SwiftUI

struct EditProfileView: View {
    @State private var name: String
    @State private var email: String

    init(user: UserModel) {
        _name = State(initialValue: user.name)
        _email = State(initialValue: user.email ?? "")
    }

    var body: some View {
        VStack(spacing: Spacing.l) {
            Text("Edit Profile")
                .font(.largeTitle)
                .foregroundColor(.primaryTeal)

            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)

            PrimaryButton(title: "Save Changes") {
                // Action to save changes
            }

            Spacer()
        }
        .padding()
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: UserModel(id: "123", name: "Jane Doe", onboardingCompleted: true))
    }
}
