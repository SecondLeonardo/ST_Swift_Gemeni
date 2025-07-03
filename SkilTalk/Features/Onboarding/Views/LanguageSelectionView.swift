import SwiftUI

struct LanguageSelectionView: View {
    @State private var selectedNativeLanguage: String? = nil
    @State private var selectedSecondLanguage: String? = nil
    @State private var secondLanguageProficiency: String? = nil

    let languages = ["English", "Spanish", "French", "German", "Chinese", "Japanese", "Korean"]
    let proficiencyLevels = ["Beginner", "Elementary", "Intermediate", "Advanced", "Proficient"]

    var body: some View {
        VStack {
            Text("Select your Languages")
                .font(.title1)
                .foregroundColor(.primaryTeal)
                .padding(.bottom, Spacing.m)

            Section(header: Text("Native Language").font(.headline)) {
                Picker("Native Language", selection: $selectedNativeLanguage) {
                    ForEach(languages, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.wheel)
            }

            Section(header: Text("Second Language").font(.headline)) {
                Picker("Second Language", selection: $selectedSecondLanguage) {
                    ForEach(languages, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.wheel)

                Picker("Proficiency", selection: $secondLanguageProficiency) {
                    ForEach(proficiencyLevels, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
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

struct LanguageSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageSelectionView()
    }
}
