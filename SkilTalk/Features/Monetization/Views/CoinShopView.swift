import SwiftUI

struct CoinShopView: View {
    var body: some View {
        VStack {
            Text("ST Coin Shop")
                .font(.largeTitle)
                .foregroundColor(.primaryTeal)
                .padding(.bottom, Spacing.m)

            Text("Top up your ST Coins to unlock premium features and send gifts!")
                .font(.bodyText)
                .foregroundColor(.textSecondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, Spacing.xl)
                .padding(.bottom, Spacing.xxl)

            // Placeholder for coin packages
            VStack(spacing: Spacing.m) {
                CoinPackageCard(coins: 100, price: "€0.99")
                CoinPackageCard(coins: 500, price: "€4.99", bonus: "+50 Coins")
                CoinPackageCard(coins: 1000, price: "€9.99", bonus: "+150 Coins")
            }
            .padding(.horizontal)

            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct CoinShopView_Previews: PreviewProvider {
    static var previews: some View {
        CoinShopView()
    }
}

struct CoinPackageCard: View {
    let coins: Int
    let price: String
    var bonus: String? = nil

    var body: some View {
        BaseCard {
            VStack(spacing: Spacing.s) {
                Image(systemName: "dollarsign.circle.fill") // Placeholder for coin icon
                    .font(.largeTitle)
                    .foregroundColor(.yellow)
                Text("\(coins) ST Coins")
                    .font(.headline)
                Text(price)
                    .font(.title2)
                    .foregroundColor(.primaryTeal)
                if let bonus = bonus {
                    Text(bonus)
                        .font(.footnote)
                        .padding(.horizontal, Spacing.s)
                        .padding(.vertical, Spacing.xs)
                        .background(Color.green.opacity(0.3))
                        .cornerRadius(5)
                }
            }
        }
    }
}
