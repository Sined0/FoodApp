//
//  SectionRecipte+CoreDataProperties.swift
//  MovieApp
//
//  Created by Denis Orlenko on 23.05.2023.
//
//

import Foundation
import CoreData


extension SectionRecipte {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SectionRecipte> {
        return NSFetchRequest<SectionRecipte>(entityName: "SectionRecipte")
    }

    @NSManaged public var section: String?
    @NSManaged public var mySaveRecipte: NSSet?

}

// MARK: Generated accessors for mySaveRecipte
extension SectionRecipte {

    @objc(addMySaveRecipteObject:)
    @NSManaged public func addToMySaveRecipte(_ value: BookOfRecipte)

    @objc(removeMySaveRecipteObject:)
    @NSManaged public func removeFromMySaveRecipte(_ value: BookOfRecipte)

    @objc(addMySaveRecipte:)
    @NSManaged public func addToMySaveRecipte(_ values: NSSet)

    @objc(removeMySaveRecipte:)
    @NSManaged public func removeFromMySaveRecipte(_ values: NSSet)

}

extension SectionRecipte : Identifiable {

}
