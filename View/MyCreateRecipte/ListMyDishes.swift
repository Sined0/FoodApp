//
//  ListMyDishes.swift
//  MovieApp
//
//  Created by Denis Orlenko on 22.05.2023.
//

import SwiftUI

struct ListMyDishes: View {
    
    @Environment(\.managedObjectContext) var viewcontext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath:\BookOfRecipte.title, ascending: true)]) var bookOfReciptes: FetchedResults<BookOfRecipte>
    @ObservedObject var corere: CoreDataManage
    
    var body: some View {
        Section {
            List{
                ForEach(bookOfReciptes){item in
                        Text(item.title ?? "")
                }.onDelete{index in
                    corere.deleteRecp(index, bookOfRec: bookOfReciptes, context: viewcontext)}
            }
        }
    }
}

