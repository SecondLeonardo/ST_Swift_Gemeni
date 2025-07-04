import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode // For back button
    @StateObject var viewModel: SignUpViewModel

    var body: some View {
        VStack(spacing: Spacing.l) {
            Text("Sign Up")
                .font(.largeTitle)
                .foregroundColor(.primaryTeal)

            TextField("Email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Confirm Password", text: $viewModel.confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            PrimaryButton(title: "Create Account") {
                Task {
                    await viewModel.signUp()
                }
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Back") // Show navigation title for back button
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
