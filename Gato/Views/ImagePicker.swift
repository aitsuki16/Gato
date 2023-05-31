//
//  ImagePicker.swift
//  Gato
//
//  Created by Aida Igarashi on 2023/04/30.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) private var presentationMode
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var selectedImage: UIImage

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator

        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var imagePickerWrapper: ImagePicker

        init(_ parent: ImagePicker) {
            self.imagePickerWrapper = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                imagePickerWrapper.selectedImage = image

                // Store the selected image in UserDefaults
                if let imageData = image.pngData() {
                    UserDefaults.standard.set(imageData, forKey: "SelectedImage")
                }
            }

            imagePickerWrapper.presentationMode.wrappedValue.dismiss()
        }
    }
}
