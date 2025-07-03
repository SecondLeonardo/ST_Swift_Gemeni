import SwiftUI

struct SearchFilterView: View {
    @State private var selectedLanguage: String? = nil
    @State private var selectedCountry: String? = nil
    @State private var isVIPFilterActive = false // Placeholder for VIP filter logic

    let languages = ["English", "Spanish", "French"]
    let countries = ["USA", "Canada", "UK"]

    var body: some View {
        VStack {
            Text("Search Filters")
                .font(.largeTitle)
                .foregroundColor(.primaryTeal)
                .padding(.bottom, Spacing.m)

            Picker("Language", selection: $selectedLanguage) {
                Text("None").tag(nil as String?)
                ForEach(languages, id: \.self) { language in
                    Text(language).tag(language as String?)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)

            Picker("Country", selection: $selectedCountry) {
                Text("None").tag(nil as String?)
                ForEach(countries, id: \.self) { country in
                    Text(country).tag(country as String?)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)

            Toggle(isOn: $isVIPFilterActive) {
                Text("VIP Filter (e.g., Gender, Age)")
            }
            .padding()

            PrimaryButton(title: "Apply Filters") {
                // Action to apply filters
            }
            .padding()

            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct SearchFilterView_Previews: PreviewProvider {
    static var previews: some View {
        SearchFilterView()
    }
}
