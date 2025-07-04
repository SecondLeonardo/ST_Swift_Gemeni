import SwiftUI

struct LanguageSelectionView: View {
    @StateObject var viewModel: LanguageSelectionViewModel
    let onNext: () -> Void

    var body: some View {
        VStack {
            Text("Select your Languages")
                .font(.title1)
                .foregroundColor(.primaryTeal)
                .padding(.bottom, Spacing.m)

            Section(header: Text("Native Language").font(.headline)) {
                Picker("Native Language", selection: $viewModel.selectedNativeLanguage) {
                    ForEach(viewModel.languages, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.wheel)
            }

            Section(header: Text("Second Language").font(.headline)) {
                Picker("Second Language", selection: $viewModel.selectedSecondLanguage) {
                    ForEach(viewModel.languages, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.wheel)

                Picker("Proficiency", selection: $viewModel.selectedSecondLanguageProficiency) {
                    ForEach(viewModel.proficiencyLevels, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            }

            PrimaryButton(title: "Next") {
                onNext()
            }
            .padding()

            Spacer()
        }
        .onAppear {
            Task {
                await viewModel.loadLanguages()
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct LanguageSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageSelectionView(viewModel: LanguageSelectionViewModel(referenceDataService: LocalJSONReferenceDataService()), onNext: {})
    }
}
