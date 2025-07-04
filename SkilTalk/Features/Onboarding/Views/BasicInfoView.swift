import SwiftUI

struct BasicInfoView: View {
    @StateObject var viewModel: BasicInfoViewModel
    let onNext: () -> Void

    var body: some View {
        VStack(spacing: Spacing.l) {
            Text("Basic Info")
                .font(.largeTitle)
                .foregroundColor(.primaryTeal)

            TextField("I'm from", text: $viewModel.country)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Native language", text: $viewModel.nativeLanguage)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Second language", text: $viewModel.secondLanguage)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Expertise", text: $viewModel.expertise)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Target Skill", text: $viewModel.targetSkill)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            PrimaryButton(title: "Next") {
                onNext()
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
        BasicInfoView(viewModel: BasicInfoViewModel(), onNext: {})
    }
}
