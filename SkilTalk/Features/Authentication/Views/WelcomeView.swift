import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("SkillTalk")
                .font(.largeTitle)
                .foregroundColor(.primaryTeal)
                .padding(.bottom, Spacing.s)

            Text("To the World")
                .font(.title1)
                .foregroundColor(.textPrimary)
                .padding(.bottom, Spacing.m)

            Text("Practice 150+ Skill")
                .font(.bodyText)
                .foregroundColor(.textSecondary)
            Text("Meet 50 mil global friends")
                .font(.bodyText)
                .foregroundColor(.textSecondary)
                .padding(.bottom, Spacing.xl)

            PrimaryButton(title: "Sign in with Apple") {
                // Action for Sign in with Apple
            }
            .padding(.horizontal)

            HStack(spacing: Spacing.l) {
                // Placeholder for other social login icons
                Image(systemName: "globe")
                    .font(.title2)
                Image(systemName: "face.smiling")
                    .font(.title2)
                Image(systemName: "envelope")
                    .font(.title2)
            }
            .padding(.top, Spacing.l)

            Spacer()
        }
        .background(Color.backgroundLight.edgesIgnoringSafeArea(.all))
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
