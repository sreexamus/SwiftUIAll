//
//  PhotosViewModel.swift
//  SwiftUIPhotosPicker
//
//  Created by sreekanth reddy iragam on 6/21/23.
//

import Foundation
import PhotosUI
import SwiftUI

@MainActor
class PhotosViewModel: ObservableObject {
    @Published var selectedImage: UIImage? = nil
    @Published var selectedPickerItem: PhotosPickerItem? = nil
}
