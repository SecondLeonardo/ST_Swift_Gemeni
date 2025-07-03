import Foundation

class CountrySelectionViewModel: ObservableObject {
    @Published var countries: [String] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    private let referenceDataService: ReferenceDataServiceProtocol

    init(referenceDataService: ReferenceDataServiceProtocol) {
        self.referenceDataService = referenceDataService
    }

    func loadCountries() async {
        isLoading = true
        errorMessage = nil
        do {
            // Assuming countries.json contains an array of strings or objects with a 'name' field
            let loadedCountries = try await referenceDataService.loadAll(dataType: String.self, fileName: "countries")
            DispatchQueue.main.async {
                self.countries = loadedCountries
            }
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
