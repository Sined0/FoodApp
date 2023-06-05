////
////  SaveRecipte.swift
////  MovieApp
////
////  Created by Denis Orlenko on 01.03.2023.
////
//
import SwiftUI

struct SaveRecipte: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var viewcontext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath:\SectionRecipte.section, ascending: true)]) var secOfReciptes: FetchedResults<SectionRecipte>
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath:\BookOfRecipte.title, ascending: true)]) var bookOfReciptes: FetchedResults<BookOfRecipte>
    @ObservedObject var corere: CoreDataManage
    @State var boolsss: Bool = false
    @State var nameSection: String = ""
    
    var body: some View {
        
        NavigationStack{
            VStack{
                Section{
                    List{
                        NavigationLink(destination: ListMyDishes(corere: corere)){
                            HStack{
                                Text("All Save Dishes")
                            }
                        }
                        ForEach(secOfReciptes, id: \.self){ item in
                            NavigationLink(destination: List {
                                ForEach(item.itemArray){
                                    itemTag in
                                    NavigationLink("\(itemTag.title ?? "")",
                                                   destination: Recipte(dataViewModel: corere , bookRec: itemTag, editorNameRecipte: itemTag.title ?? "Empty", editorNameIngredients: itemTag.ingredients ?? "Empty" , PhotoUrl: itemTag.photo ?? "Empty", PhotoData: itemTag.attribute ?? Data(count: 0)))
                                }.onDelete{index in
                                  corere.deleteRecp(index, bookOfRec: bookOfReciptes, context: viewcontext)}
                            }){
                                HStack{
                                    Text(item.section!)
                                    Spacer()
                                    Text("\(item.itemArray.count)")
                                }
                            }
                            .deleteDisabled(item.itemArray.count > 0)
                        }.onDelete{index in
                            corere.deleteSection(index: index, secOfRec: secOfReciptes, context: viewcontext)
                        }
                    }
                }
            }
            .sheet(isPresented: $boolsss){
                AddSection(dataCore: corere, alert: false, nameSections: $nameSection)
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Add"){
                        boolsss.toggle()
                    }
                }
            }
 
        }
    }

}






