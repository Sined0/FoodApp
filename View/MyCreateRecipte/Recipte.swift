//
//  Recipte.swift
//  MovieApp
//
//  Created by Denis Orlenko on 06.03.2023.
//

import SwiftUI

struct Recipte: View {
    
    @Environment(\.managedObjectContext) var viewcontext
    @ObservedObject var dataViewModel: CoreDataManage
    @ObservedObject var bookRec: BookOfRecipte
    @State var editorNameRecipte: String
    @State var editorNameIngredients: String
    @State var PhotoUrl: String
    @State var PhotoData: Data
    

    var body: some View {
        
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.cyan)
                    .opacity(0.1)
                    .padding(5)
                    Section{
                        VStack{
                            Text("\(editorNameRecipte)")
                                .font(.largeTitle)
                                .padding(.vertical, 20)
                                .padding(.horizontal, 20)
                            
                            if PhotoData.count == 0 {
                                AsyncImage(url: URL(string: PhotoUrl)){image in
                                    if let img = image.image {
                                        img
                                            .resizable()
                                            .cornerRadius(20)
                                            .aspectRatio(3/2, contentMode: .fit)
                                            .frame(width: 250, height: 150)
                                    }
                                }
                            } else {
                                Image(uiImage: UIImage(data: PhotoData)!)
                                       .resizable()
                                       .cornerRadius(20)
                                       .aspectRatio(3/2, contentMode: .fit)
                                       .frame(width: 250, height: 150)
                            }
                            HStack{
                                Text("\(editorNameIngredients)")
                                    .padding(.horizontal, 20)
                                    .padding(.bottom, 10)
                            }
                            Spacer()
                        }.padding(.bottom, 20)
                }
        }
    }
}

