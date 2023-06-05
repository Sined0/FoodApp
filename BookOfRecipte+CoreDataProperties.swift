//
//  BookOfRecipte+CoreDataProperties.swift
//  MovieApp
//
//  Created by Denis Orlenko on 23.05.2023.
//
//

import Foundation
import CoreData


extension BookOfRecipte {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookOfRecipte> {
        return NSFetchRequest<BookOfRecipte>(entityName: "BookOfRecipte")
    }

    @NSManaged public var ingredients: String?
    @NSManaged public var photo: String?
    @NSManaged public var title: String?
    @NSManaged public var attribute: Data?
    @NSManaged public var secRecipte: NSSet?

}

// MARK: Generated accessors for secRecipte
extension BookOfRecipte {

    @objc(addSecRecipteObject:)
    @NSManaged public func addToSecRecipte(_ value: SectionRecipte)

    @objc(removeSecRecipteObject:)
    @NSManaged public func removeFromSecRecipte(_ value: SectionRecipte)

    @objc(addSecRecipte:)
    @NSManaged public func addToSecRecipte(_ values: NSSet)

    @objc(removeSecRecipte:)
    @NSManaged public func removeFromSecRecipte(_ values: NSSet)

}

extension BookOfRecipte : Identifiable {

}
