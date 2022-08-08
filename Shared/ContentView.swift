//
//  ContentView.swift
//  Shared
//
//  Created by Sam on 07/08/2022.
//

import SwiftUI
import UIKit

struct ContentView: View {
//    @State private var showImageSheet = false
    @StateObject var texts = ImageDataModel()//
//    @State private var testTexts:[ImageData] = [ImageData(content: "1234")]
    let coreDM: CoreDataManager
    var body: some View {
        
        NavigationView{
            VStack{
                if texts.imageData.count > 0{
                    List{
                        ForEach(texts.imageData){text in
                            NavigationLink(
                                destination:ScrollView{Text(text.content)},
                                label: {
                                    Text(text.content).lineLimit(1)
                                }).mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        }
                    }
                    
                }
                else{
                    Text("No Images")
                }
            }
        }.overlay(NavigationBar(title: "Rex").environmentObject(texts))
            .navigationTitle("Home")
//        NavigationView{
//            VStack{
//                if texts.count > 0{
//                    List{
//                        ForEach(texts){text in
//                            NavigationLink(
//                                destination:ScrollView{Text(text.content)},
//                                label: {
//                                    Text(text.content).lineLimit(1)
//                                })
//                        }
//                    }
//                }
//                else{
//                    Text("No Images").font(.title)
//                }
//            }
////                .navigationTitle("Scan Ingredients")
//                .navigationBarTitleDisplayMode(.inline)
//                .navigationBarTitle("Image")
//                .navigationBarItems(trailing: Button(action: {
//                    self.showImageSheet = true
//                }, label: {
//                    Image(systemName: "doc.text.viewfinder")
//                        .font(.title)
//                })
//                .sheet(isPresented: $showImageSheet, content: {
//                    self.makeCameraView()
//                })
//                )
//        }
    }
//    private func makeCameraView() -> CameraView {
//        CameraView(completion: {
//            textPerPage in
//            if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines){
//                let newImageData = ImageData(content: outputText)
//                self.texts.append(newImageData)
//            }
//            self.showImageSheet = false
//        })
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
