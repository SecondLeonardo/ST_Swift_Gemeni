import SwiftUI

struct UserCardView: View {
    let userName: String
    let userSkills: String
    let userLocation: String

    var body: some View {
        BaseCard {
            VStack(alignment: .leading, spacing: Spacing.s) {
                HStack {
                    Image(systemName: "person.circle.fill") // Placeholder for profile picture
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text(userName)
                            .font(.headline)
                        Text(userLocation)
                            .font(.subheadline)
                            .foregroundColor(.textSecondary)
                    }
                    Spacer()
                }
                Text(userSkills)
                    .font(.bodyText)
            }
        }
    }
}

struct UserCardView_Previews: PreviewProvider {
    static var previews: some View {
        UserCardView(userName: "John Doe", userSkills: "Expert: Cooking, Target: Coding", userLocation: "New York, USA")
            .padding()
    }
}
