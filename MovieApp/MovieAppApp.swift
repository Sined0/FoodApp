//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Denis Orlenko on 27.02.2023.
//

import SwiftUI

@main
struct MovieAppApp: App {
  
    @StateObject var dataConten = CoreDataManage.shared
    var body: some Scene {
        WindowGroup {
            let tempImage = UIImage(systemName: "map")?.pngData()
            ContentView(dataCors: dataConten, imagePhoto: tempImage!, textSearch: "")
                .environment(\.managedObjectContext, dataConten.container.viewContext)
                .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
                
        }
    }
}
