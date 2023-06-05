//
//  ContentView.swift
//  MovieApp
//
//  Created by Denis Orlenko on 29.05.2023.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var viewcontext
    @ObservedObject var dataCors: CoreDataManage
    @StateObject  var networkModel = JsonParse()
    @State var imagePhoto: Data
    @State var textSearch: String
    
    var body: some View {
        TabView{
            MainFood(dataCors: dataCors, textSearch: textSearch)
                .tabItem{Label("Reciptes", image: "camera")}
            
            SaveRecipte(corere: dataCors)
                .tabItem{Label("save", image: "camera")}
            
            MyRecipte(dataCores: dataCors, myNameRecipe: "", myNameIngridients: "", myNamePhoto: (UIImage(systemName: "map")?.pngData())!, activeSheet: false, alert: false, alertElse: false)
                .tabItem{Label("my", image: "camera")}
            
        }
        
    }
}
