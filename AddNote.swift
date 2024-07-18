//
//  AddNote.swift
//  Notes App
//
//  Created by Rajveer Sodhi on 2024-07-10.
//

import SwiftUI

struct AddNote: View {
    
    @State var title: String = "New Note"
    @State var note: String = "Note"
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                TextField("Name", text: $title)
                    .padding()
                    .background(
                        Rectangle()
                            .cornerRadius(15)
                            .foregroundStyle(.white)
                    )
                    .padding()
                
                TextEditor(text: $note)
                    .padding()
                    .background(
                        Rectangle()
                            .cornerRadius(15)
                            .foregroundStyle(.white)
                    )
                    .padding()
            }
        }
        .background(
            Rectangle()
                .foregroundColor(Color(white: 0.95))
                .ignoresSafeArea()
        )
        .toolbar {
            ToolbarItem() {
                Button {
                    
                } label: {
                    Text("Delete")
                        .foregroundStyle(.red)
                }
            }
            
           ToolbarItem() {
               Button {
                   
               } label: {
                   Text("Save")
               }
           }
       }
        .navigationTitle("Add Note")
        .toolbarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddNote()
}
