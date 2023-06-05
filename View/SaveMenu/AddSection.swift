//
//  AddSection.swift
//  MovieApp
//
//  Created by Denis Orlenko on 03.03.2023.
//

import SwiftUI

struct AddSection: View {
    
    @Environment(\.managedObjectContext) private var viewcontext
    @Environment(\.dismiss) var dismiss
    @ObservedObject var dataCore: CoreDataManage
    @State var alert: Bool
    @Binding var nameSections: String
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Enter your section", text: $nameSections)
                buttonSave
                    .alert("Please enter the name of the section", isPresented: $alert){
                        Button("OK", role: .cancel){}
                    }
                
            }
            
        }
    }
    
    //MARK: Button
    var buttonSave: some View {
        Button("Save"){
            if nameSections.isEmpty == false && nameSections.hasPrefix(" ") == false {
                dataCore.addCoreDataSection(nameSec: nameSections, manag: viewcontext)
                dismiss()
                nameSections = ""
            } else {
                alert.toggle()
            }
        }
    }
    
}

