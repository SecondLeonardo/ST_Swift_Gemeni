import SwiftUI

struct VIPSubscriptionView: View {
    var body: some View {
        VStack {
            Text("Get SkillTalk VIP")
                .font(.largeTitle)
                .foregroundColor(.primaryTeal)
                .padding(.bottom, Spacing.m)

            Text("Unlock exclusive features and enhance your SkillTalk experience!")
                .font(.bodyText)
                .foregroundColor(.textSecondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, Spacing.xl)
                .padding(.bottom, Spacing.xxl)

            // Placeholder for subscription plans
            VStack(spacing: Spacing.m) {
                SubscriptionPlanCard(title: "1 Month Plan", price: "€9.99")
                SubscriptionPlanCard(title: "12 Months Plan", price: "€59.99", highlight: "Most Popular")
                SubscriptionPlanCard(title: "Lifetime Plan", price: "€149.99", highlight: "Best Value")
            }
            .padding(.horizontal)

            PrimaryButton(title: "Continue") {
                // Action to proceed to App Store purchase
            }
            .padding()

            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct VIPSubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        VIPSubscriptionView()
    }
}

struct SubscriptionPlanCard: View {
    let title: String
    let price: String
    var highlight: String? = nil

    var body: some View {
        BaseCard {
            VStack(spacing: Spacing.s) {
                Text(title)
                    .font(.headline)
                Text(price)
                    .font(.title2)
                    .foregroundColor(.primaryTeal)
                if let highlight = highlight {
                    Text(highlight)
                        .font(.footnote)
                        .padding(.horizontal, Spacing.s)
                        .padding(.vertical, Spacing.xs)
                        .background(Color.yellow.opacity(0.3))
                        .cornerRadius(5)
                }
            }
        }
    }
}
