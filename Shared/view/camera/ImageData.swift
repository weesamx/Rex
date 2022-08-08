//
//  ImageData.swift
//  Rex
//
//  Created by Sam on 08/08/2022.
//

import Foundation

struct ImageData:Identifiable {
    var id = UUID()
    let content:String
    
    init(content:String) {
        self.content = content
    }
}
