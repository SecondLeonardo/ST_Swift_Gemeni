import SwiftUI

struct BasicInfoView: View {
    @State private var country: String = ""
    @State private var nativeLanguage: String = ""
    @State private var secondLanguage: String = ""
    @State private var expertise: String = ""
    @State private var targetSkill: String = ""

    var body: some View {
        VStack(spacing: Spacing.l) {
            Text("Basic Info")
                .font(.largeTitle)
                .foregroundColor(.primaryTeal)

            TextField("I'm from", text: $country)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Native language", text: $nativeLanguage)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Second language", text: $secondLanguage)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Expertise", text: $expertise)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Target Skill", text: $targetSkill)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            PrimaryButton(title: "Next") {
                // Action to proceed to next step
            }

            Spacer()
        }
        .padding()
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct BasicInfoView_Previews: PreviewProvider {
    static var previews: some View {
        BasicInfoView()
    }
}
