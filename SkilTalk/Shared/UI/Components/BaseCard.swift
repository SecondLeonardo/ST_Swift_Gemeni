import SwiftUI

struct BaseCard<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

struct BaseCard_Previews: PreviewProvider {
    static var previews: some View {
        BaseCard {
            Text("This is a base card.")
                .font(.title2)
        }
        .padding()
    }
}
