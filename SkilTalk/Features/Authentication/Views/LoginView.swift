import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: Spacing.l) {
            Text("Login")
                .font(.largeTitle)
                .foregroundColor(.primaryTeal)

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            PrimaryButton(title: "Sign In") {
                // Action for Sign In
            }

            Button("Forgot Password?") {
                // Action for Forgot Password
            }
            .foregroundColor(.primaryTeal)

            Spacer()
        }
        .padding()
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
