import SwiftUI

struct MatchView: View {
    var body: some View {
        VStack {
            Text("Find Match")
                .font(.largeTitle)
                .foregroundColor(.primaryTeal)
                .padding(.bottom, Spacing.m)

            // Placeholder for user cards or match results
            Text("Matching results will appear here.")
                .font(.bodyText)
                .foregroundColor(.textSecondary)

            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        MatchView()
    }
}
