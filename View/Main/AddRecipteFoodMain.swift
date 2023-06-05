//
//  AddRecipte.swift
//  MovieApp
//
//  Created by Denis Orlenko on 03.03.2023.
//

import SwiftUI

struct AddRecipte: View {
    
    @Environment(\.managedObjectContext) private var viewcontext
    @Environment(\.dismiss) var dismiss
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath:\SectionRecipte.section, ascending: true)]) var secOfReciptes: FetchedResults<SectionRecipte>
    @ObservedObject var dataCores: CoreDataManage
    @State var infosTitle: String
    @State var infoIngr: String
    @State var infoUrlPhoto: String
    @State var avaibleSections: [SectionRecipte] = []
    @State var alert: Bool
    
    var body: some View {
        
        Form{
            Text(infosTitle)
            Text("Select name section")
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(dataCores.avaibleSections){sec in
                        Button(sec.section ?? ""){
                            dataCores.removeSelectSection(sec)
                        }
                    }
                }
            }
            Text("Section")
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(secOfReciptes){secOf in
                        Button(secOf.section ?? ""){
                            dataCores.addSelectSection(secOf)
                        }
                    }
                }
            }
            butonSave
                .alert("Please select name section", isPresented: $alert){
                    Button("OK", role: .cancel){}
                    
                }
            
        }
    }
    
    var butonSave: some View {
        Button("Saves"){
            if dataCores.avaibleSections.isEmpty == false && dataCores.avaivbleRec.isEmpty{
                dataCores.addCoreDataRecipte(title: infosTitle, ingr: infoIngr, urlImage: infoUrlPhoto, arraySect: dataCores.avaibleSections, imgData: Data(count: 0), context: viewcontext)
                print("Yes")
                dataCores.avaibleSections.removeAll()
                dismiss()
            } else {
                alert.toggle()
            }
        }
    }
}

