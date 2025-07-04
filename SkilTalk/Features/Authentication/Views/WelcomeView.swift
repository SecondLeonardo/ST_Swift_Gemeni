import SwiftUI

struct WelcomeView: View {
    let onSignInTapped: () -> Void
    let onSignUpTapped: () -> Void

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
                onSignInTapped()
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

            Button(action: onSignUpTapped) {
                Text("Don't have an account? Sign Up")
                    .font(.bodyText)
                    .foregroundColor(.primaryTeal)
            }
            .padding(.top, Spacing.m)

            Spacer()
        }
        .background(Color.backgroundLight.edgesIgnoringSafeArea(.all))
        .navigationTitle("") // Hide default navigation title
        .navigationBarHidden(true) // Hide default navigation bar
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(onSignInTapped: {}, onSignUpTapped: {})
    }
}