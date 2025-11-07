//
//  NoteEntity+CoreDataClass.swift
//  ToDoListApp
//
//  Created by Amankeldi Zhetkergen on 07.11.2025.
//
//

public import Foundation
public import CoreData

public typealias NoteEntityCoreDataClassSet = NSSet

@objc(NoteEntity)
public class NoteEntity: NSManagedObject {

}

public typealias NoteEntityCoreDataPropertiesSet = NSSet

extension NoteEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteEntity> {
        return NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
    }

    @NSManaged public var date: Date?
    @NSManaged public var id: String?
    @NSManaged public var text: String?
    @NSManaged public var title: String?

}

extension NoteEntity : Identifiable {

}
