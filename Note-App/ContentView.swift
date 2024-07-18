//
//  ContentView.swift
//  Note-App
//
//  Created by Ayush S on 2024-07-10.
//

import SwiftUI

struct ContentView: View {
    
    @State private var note = NoteView()
    var body: some View {
        NavigationStack{
            note.toolbar{
                ToolbarItem() {
                    NavigationLink(
                        destination:AddNote(),
                        label: {
                            Image(systemName: "plus")
                        }
                    )
                }
                
            }.toolbarBackground(.visible).toolbarTitleDisplayMode(.large)
        }
                   
                  
                   
        
            }

}

#Preview {
    ContentView()
}
