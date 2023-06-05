//
//  ViewSaveMenu.swift
//  MovieApp
//
//  Created by Denis Orlenko on 02.03.2023.
//

import SwiftUI
import CoreData

struct MyRecipte: View {
    
    @Environment(\.managedObjectContext) var viewcontext
    @Environment(\.dismiss) var dismiss
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath:\SectionRecipte.section, ascending: true)]) var secOfReciptes: FetchedResults<SectionRecipte>
    @ObservedObject var dataCores: CoreDataManage
    @State var avaibleSections: [SectionRecipte] = []
    @State var myNameRecipe: String
    @State var myNameIngridients: String
    @State var myNamePhoto: Data
    @State var activeSheet: Bool
    @State var alert: Bool
    @State var alertElse: Bool
    
    var body: some View {
        Form{
            Section{
                Text("Dishes")
                TextField("Name Recipe", text: $myNameRecipe)
            }
            Section{
                Image(uiImage: UIImage(data: myNamePhoto)!)
                    .resizable()
                    .frame(width: 304, height: 200)
                    .cornerRadius(15)
                HStack{
                    Spacer()
                    Button("Select photo dishes"){
                        activeSheet.toggle()
                    }
                    Spacer()
                }
            }
            Section{
                Text("Ingridients dishes")
                TextEditor(text: $myNameIngridients)
            }
            HStack{
                Spacer()
                Section{
                    VStack{
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
                        buttonSave
                            .alert("Dishes Save", isPresented: $alert){
                                Button("OK", role: .cancel){}
                                
                            }
                            .alert("Please enter empty field", isPresented: $alertElse){
                                Button("OK", role: .cancel){}
                            }
                    }
                }
                Spacer()
            }
        }
        .sheet(isPresented: $activeSheet){
            ImagePicker(sourceType: .photoLibrary, selectedImage: $myNamePhoto)
        }
        
    }
    
    //MARK: Button
    var buttonSave: some View {
        Button("Saves"){
            if (myNameRecipe.isEmpty == false && myNameRecipe.hasPrefix(" ") == false) &&
                (myNameIngridients.isEmpty == false && myNameIngridients.hasPrefix(" ") == false){
                dataCores.addCoreDataRecipte(title: myNameRecipe, ingr: myNameIngridients, urlImage: "", arraySect: dataCores.avaibleSections, imgData: myNamePhoto, context: viewcontext)
                print("\(myNamePhoto)")
                dataCores.avaibleSections.removeAll()
                myNameRecipe = ""
                myNameIngridients = ""
                myNamePhoto = (UIImage(systemName: "map")?.pngData())!
                print("Yes")
                alert.toggle()
            } else {
                alertElse.toggle()
            }
        }
    }
}


