import SwiftUI

struct CountrySelectionView: View {
    @StateObject var viewModel: CountrySelectionViewModel
    let onNext: () -> Void

    var body: some View {
        VStack {
            Text("Select your Country")
                .font(.title1)
                .foregroundColor(.primaryTeal)
                .padding(.bottom, Spacing.m)

            List(viewModel.countries, id: \.self) {
                country in
                HStack {
                    Text(country)
                    Spacer()
                    if viewModel.selectedCountry == country {
                        Image(systemName: "checkmark")
                            .foregroundColor(.primaryTeal)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    viewModel.selectedCountry = country
                }
            }
            .onAppear {
                Task {
                    await viewModel.loadCountries()
                }
            }

            PrimaryButton(title: "Next") {
                onNext()
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
        CountrySelectionView(viewModel: CountrySelectionViewModel(referenceDataService: LocalJSONReferenceDataService()), onNext: {})
    }
}
