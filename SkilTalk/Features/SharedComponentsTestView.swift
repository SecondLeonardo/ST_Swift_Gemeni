import SwiftUI

struct SharedComponentsTestView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Buttons")) {
                    PrimaryButton(title: "Primary Button") {
                        print("Primary Button Tapped")
                    }
                }

                Section(header: Text("Cards")) {
                    BaseCard {
                        VStack(alignment: .leading) {
                            Text("Card Title")
                                .font(.title3)
                                .padding(.bottom, Spacing.xs)
                            Text("This is some content inside a base card.")
                                .font(.bodyText)
                        }
                    }
                }
            }
            .navigationTitle("Shared Components")
        }
    }
}

struct SharedComponentsTestView_Previews: PreviewProvider {
    static var previews: some View {
        SharedComponentsTestView()
    }
}
