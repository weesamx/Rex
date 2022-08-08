//
//  NavigationBar.swift
//  Rex
//
//  Created by Sam on 08/08/2022.
//

import SwiftUI

struct NavigationBar: View {
    var title = ""
    @State private var showImageSheet = false
    @EnvironmentObject var texts : ImageDataModel
    
    var body: some View {
        ZStack{
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
            HStack{
                Text(title)
                    .font(.largeTitle.weight(.bold))
                    .frame(maxWidth: . infinity, alignment:.leading)
                    .padding(.leading, 20)
                Spacer()
                Button {
                    self.showImageSheet = true
                } label: {
                    Image(systemName: "doc.text.viewfinder").font(.title)
                }.padding()
                    .sheet(isPresented: $showImageSheet, content: {self.makeCameraView()})
//
//                Button(action: {self.showImageSheet = true}, label:  Image(systemName: "doc.text.viewfinder").font(.title))
                
            }
            
        }
        .frame(height: 70)
        .frame(maxHeight: .infinity,alignment: .top)
    }
    
    private func makeCameraView() -> CameraView {
        CameraView(completion: {
            textPerPage in
            if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines){
                let newImageData = ImageData(content: outputText)
                texts.imageData.append(newImageData)
            }
            self.showImageSheet = false
        })
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "Rex")
    }
}
