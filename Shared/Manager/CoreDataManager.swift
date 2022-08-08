//
//  CoreDataManager.swift
//  Rex
//
//  Created by Sam on 09/08/2022.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    
    init(){
        persistentContainer=NSPersistentContainer(name:"RexDataModel")
        persistentContainer.loadPersistentStores{(description,error)in
            if let error=error{
                 fatalError("Core Data Store failed\(error.localizedDescription)")
            }
        }
    }
    
    func saveDog(name: String){
        let dog = Dog(context:persistentContainer.viewContext)
        dog.name = name
        dog.uuid = UUID()

        do{
            try persistentContainer.viewContext.save()
        }catch{
            print("Failed to save movie\(error)")
        }
    }
}
