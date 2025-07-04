import SwiftUI

struct ProfilePictureView: View {
    @State private var selectedImage: UIImage? = nil
    @State private var isShowingImagePicker = false
    let onNext: () -> Void

    var body: some View {
        VStack {
            Text("Add a Profile Picture")
                .font(.title1)
                .foregroundColor(.primaryTeal)
                .padding(.bottom, Spacing.m)

            Text("Last step! A real photo helps others get to know you better.")
                .font(.bodyText)
                .foregroundColor(.textSecondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, Spacing.xl)
                .padding(.bottom, Spacing.xxl)

            ZStack {
                if let selectedImage = selectedImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                } else {
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 150, height: 150)
                    Image(systemName: "person.fill")
                        .font(.system(size: 75))
                        .foregroundColor(.gray)
                }

                Button(action: { isShowingImagePicker = true }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .background(Color.white)
                        .clipShape(Circle())
                }
                .offset(x: 60, y: 60)
            }
            .padding(.bottom, Spacing.xxl)

            PrimaryButton(title: "Start Learning") {
                onNext()
            }
            .disabled(selectedImage == nil)
            .padding(.horizontal)

            Spacer()
        }
        .sheet(isPresented: $isShowingImagePicker) {
            ImagePicker(selectedImage: $selectedImage)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct ProfilePictureView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePictureView(onNext: {})
    }
}

// Simple ImagePicker for SwiftUI (requires UIKit interop)
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.dismiss) private var dismiss

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                parent.selectedImage = image
            } else if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            parent.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.dismiss()
        }
    }
}
