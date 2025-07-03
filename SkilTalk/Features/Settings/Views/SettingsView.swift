import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("Settings")
                .font(.largeTitle)
                .foregroundColor(.primaryTeal)
                .padding(.bottom, Spacing.m)

            List {
                NavigationLink(destination: Text("Account Settings")) {
                    Label("Account", systemImage: "person.crop.circle")
                }
                NavigationLink(destination: Text("Notification Settings")) {
                    Label("Notifications", systemImage: "bell")
                }
                NavigationLink(destination: Text("Privacy Settings")) {
                    Label("Privacy", systemImage: "lock")
                }
                NavigationLink(destination: Text("Chat Settings")) {
                    Label("Chat Settings", systemImage: "message")
                }
                NavigationLink(destination: Text("Learning Settings")) {
                    Label("Learning Settings", systemImage: "book")
                }
                NavigationLink(destination: Text("Dark Mode")) {
                    Label("Dark Mode", systemImage: "moon")
                }
                NavigationLink(destination: Text("About")) {
                    Label("About", systemImage: "info.circle")
                }
                NavigationLink(destination: Text("Help")) {
                    Label("Help", systemImage: "questionmark.circle")
                }
                NavigationLink(destination: Text("Clear Cache")) {
                    Label("Clear Cache", systemImage: "trash")
                }
            }

            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView()
        }
    }
}
