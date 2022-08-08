//
//  ImageDataModel.swift
//  Rex
//
//  Created by Sam on 09/08/2022.
//

import Foundation

class ImageDataModel: ObservableObject{
    @Published var imageData: [ImageData]

    init(){
        self.imageData = []
    }
}
