//
//  ContentView.swift
//  MovieApp
//
//  Created by Denis Orlenko on 27.02.2023.
//

import SwiftUI
import CoreData

struct MainFood: View {
    
    @Environment(\.managedObjectContext) var viewcontext
    @ObservedObject var dataCors: CoreDataManage
    @StateObject  var networkModel = JsonParse()
    @State var textSearch: String
    
    
    var body: some View {
        NavigationStack {
            VStack {
                
                ZStack{
                    SearchBar(text: $textSearch)
                        .padding(.top, 10)
                }
                
                List(networkModel.recipe.filter({ textSearch.isEmpty ? true : $0.title.contains(textSearch) })) { recipes in
                    NavigationLink(destination: DetailFood(dataCore: dataCors, infossTitle: recipes.title, infosIngred: recipes.ingredients.formatted(), infosImage: recipes.featured_image.formatted()) ){
                        HStack {
                            
                            AsyncImage(url: recipes.featured_image){image in
                                if let img = image.image {
                                    img
                                        .resizable()
                                        .aspectRatio(3/2, contentMode: .fit)
                                        .frame(width: 150, height: 100)
                                } else {
                                    ProgressView()
                                }
                            }
                            Text(recipes.title)
                        }
                    }
                }
                .task {
                    do {
                        try await networkModel.fethcData()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}



struct SearchBar: View {
    
    @Binding var text: String
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                
            }
        }
    }
}
