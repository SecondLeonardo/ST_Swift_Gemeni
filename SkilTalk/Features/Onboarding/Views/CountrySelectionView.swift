import SwiftUI

struct CountrySelectionView: View {
    @State private var selectedCountry: String? = nil
    let countries = ["USA", "Canada", "UK", "Germany", "France", "Japan", "China", "India"]

    var body: some View {
        VStack {
            Text("Select your Country")
                .font(.title1)
                .foregroundColor(.primaryTeal)
                .padding(.bottom, Spacing.m)

            List(countries, id: \.self) {
                country in
                HStack {
                    Text(country)
                    Spacer()
                    if selectedCountry == country {
                        Image(systemName: "checkmark")
                            .foregroundColor(.primaryTeal)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedCountry = country
                }
            }

            PrimaryButton(title: "Next") {
                // Action to proceed
            }
            .padding()

            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct CountrySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CountrySelectionView()
    }
}
