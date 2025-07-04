import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode // For back button
    @StateObject var viewModel: LoginViewModel

    var body: some View {
        VStack(spacing: Spacing.l) {
            Text("Login")
                .font(.largeTitle)
                .foregroundColor(.primaryTeal)

            TextField("Email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            PrimaryButton(title: "Sign In") {
                Task {
                    await viewModel.signIn()
                }
            }

            Button("Forgot Password?") {
                // Action for Forgot Password
            }
            .foregroundColor(.primaryTeal)

            Spacer()
        }
        .padding()
        .navigationTitle("Back") // Show navigation title for back button
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
