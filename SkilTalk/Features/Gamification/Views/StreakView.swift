import SwiftUI

struct StreakView: View {
    @State private var currentStreak: Int = 7 // Example streak

    var body: some View {
        VStack {
            Text("Your Streak")
                .font(.largeTitle)
                .foregroundColor(.primaryTeal)
                .padding(.bottom, Spacing.m)

            Text("\(currentStreak) Days")
                .font(.system(size: 80, weight: .bold))
                .foregroundColor(.primaryTeal)

            Text("Keep it up!")
                .font(.title2)
                .foregroundColor(.textSecondary)
                .padding(.bottom, Spacing.xxl)

            // Placeholder for streak calendar/progress
            Text("Streak calendar and progress will appear here.")
                .font(.bodyText)
                .foregroundColor(.textSecondary)

            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct StreakView_Previews: PreviewProvider {
    static var previews: some View {
        StreakView()
    }
}
