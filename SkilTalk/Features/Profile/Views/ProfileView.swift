import SwiftUI

struct ProfileView: View {
    let user: UserModel // Assuming user data is passed in

    var body: some View {
        VStack {
            Text("Profile")
                .font(.largeTitle)
                .foregroundColor(.primaryTeal)
                .padding(.bottom, Spacing.m)

            Image(systemName: "person.circle.fill") // Placeholder for profile picture
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding(.bottom, Spacing.s)

            Text(user.name)
                .font(.title1)

            Text(user.email ?? "No Email")
                .font(.subheadline)
                .foregroundColor(.textSecondary)

            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: UserModel(id: "123", name: "Jane Doe", onboardingCompleted: true))
    }
}
