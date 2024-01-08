//
//  PhotosPickerView.swift
//  SwiftUIPhotosPicker
//
//  Created by sreekanth reddy iragam on 6/21/23.
//

import PhotosUI
import SwiftUI

struct PhotosPickerView: View {
    @StateObject var viewModel = PhotosViewModel()
    var body: some View {
        VStack {
            if let image = viewModel.selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(3)

                            }
            PhotosPicker("Select Photo", selection: $viewModel.selectedPickerItem, matching: .images).foregroundColor(.gray)
        }.onChange(of: viewModel.selectedPickerItem) { newValue in
            
            Task {
                guard let imageData = try? await newValue?.loadTransferable(type: Data.self), let image = UIImage(data: imageData) else {
                    return
                }
                viewModel.selectedImage = image
            }
        }
    }
}

struct PhotosPickerView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosPickerView()
    }
}
