//
//  PersistentController.swift
//  ToDoListApp
//
//  Created by Amankeldi Zhetkergen on 07.11.2025.
//

import Foundation
import CoreData

final class PersistentController {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "noteDb")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}
