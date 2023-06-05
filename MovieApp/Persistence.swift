//
//  Persistence.swift
//  MovieApp
//
//  Created by Denis Orlenko on 27.02.2023.
//

import Foundation
import CoreData
import SwiftUI


class CoreDataManage: ObservableObject  {
    
    @Published var avaibleSections: [SectionRecipte] = []
    @Published var avaivbleRec: [BookOfRecipte] = []
   
    
    
    
    
    
    static let shared = CoreDataManage()
    let container: NSPersistentContainer
    
    func removeSelectSection(_ sec: SectionRecipte){
        if let indexRemove = avaibleSections.firstIndex(where: {$0.section == sec.section}){
            avaibleSections.remove(at: indexRemove)
        }
    }
    
    func addSelectSection(_ sec: SectionRecipte){
        avaibleSections.append(sec)
    }
    
    init(){
        
//        ValueTransformer.setValueTransformer(UIImageTransformer(), forName: NSValueTransformerName("UIImageTransformer"))
        container = NSPersistentContainer(name: "RecipteModelss")
        container.loadPersistentStores{ descr, error in
            if let error = error {
                print("\(error.localizedDescription) TST")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func addCoreDataSection(nameSec: String, manag: NSManagedObjectContext){
        let foodsss = SectionRecipte(context: manag)
        foodsss.section = nameSec
        save(context: manag)
    }
    
    func addCoreDataRecipte(title: String, ingr: String, urlImage: String, arraySect: [SectionRecipte], imgData: Data, context: NSManagedObjectContext){
        let food = BookOfRecipte(context: context)
        food.title = title
        food.ingredients = ingr
        food.photo = urlImage
        food.attribute = imgData
        let uniqe = Set(arraySect)
        for elements in uniqe {
            food.addToSecRecipte(elements)
        }
        save(context: context)
    }
    
    func editRecipte(nameRec: String, recipIngr: String, recipte: BookOfRecipte, context: NSManagedObjectContext) {
        let newNameRec = nameRec
        let newRecIngr = recipIngr
//        context.performAndWait {
            recipte.title = newNameRec
            recipte.ingredients = newRecIngr
            try? context.save()
//        }
    }
    
    func deleteSection(index: IndexSet, secOfRec: FetchedResults<SectionRecipte>, context: NSManagedObjectContext){
        for sectionn in index {
            let sectionDelete = secOfRec[sectionn]
            do {
                context.delete(sectionDelete)
                try context.save()
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
    func deleteRecp(_ index: IndexSet, bookOfRec: FetchedResults<BookOfRecipte>, context: NSManagedObjectContext){
        for booktionn in index {
            let sectionDelete = bookOfRec[booktionn]
            do {
                context.delete(sectionDelete)
                try context.save()
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
