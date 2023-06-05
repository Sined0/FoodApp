//
//  SwiftUIView.swift
//  MovieApp
//
//  Created by Denis Orlenko on 01.03.2023.
//

import SwiftUI
import CoreData

struct DetailFood: View {
    
    @Environment(\.managedObjectContext) private var viewcontext
    @FetchRequest(sortDescriptors: [SortDescriptor(\SectionRecipte.section, order: .reverse)]) private var foods: FetchedResults<SectionRecipte>
    @ObservedObject var dataCore: CoreDataManage
    @State var infossTitle: String
    @State var infosIngred: String
    @State var infosImage: String
    @State var openDetailAddRecipte: Bool = false

    var body: some View {
        NavigationStack{
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.cyan)
                    .opacity(0.1)
                    .padding(5)
                VStack{
                    AsyncImage(url: URL(string: "infosImage")){ images in
                        if let img = images.image {
                            img
                                .resizable()
                                .cornerRadius(20)
                                .frame(width: 400, height: 240)
                                .aspectRatio(3/2, contentMode: .fit)
                                .padding(20)
                        } else {
                            ProgressView()
                        }
                    }
                    Text(infossTitle)
                        .padding(.bottom, 10)
                        .padding(.horizontal, 10)
                    HStack{
                        Text("Cooking instruction :")
                            .padding(.leading, 20)
                            .padding(.bottom, 10)
                        Spacer()
                    }
                    Text(infosIngred)
                        .padding(.horizontal, 20)
                    Spacer()
                        Button("Save in Web Recipte"){
                            openDetailAddRecipte.toggle()
                    }.padding(.bottom, 20)
                }
            }
            .sheet(isPresented: $openDetailAddRecipte){
                AddRecipte(dataCores: dataCore, infosTitle: infossTitle, infoIngr: infosIngred, infoUrlPhoto: infosImage, alert: false)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
