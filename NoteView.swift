//
//  NoteView.swift
//  Note-App
//
//  Created by Ayush S on 2024-07-12.
//

import SwiftUI

protocol DataDelegate {
    func updateArray(newArray: String)
}

struct NoteView: View {

     @State var notes = [Note]()

    
    var body: some View {
        
        NavigationStack {
            List{
                ForEach(notes, id: \.self) { note in
                    NavigationLink(note.title) {
                     Text("Go to screen 1")
                    }.navigationTitle("Notes.")
                        
                  
                      }
                
            }.onAppear(){
                APIFunctions.functions.delegate = self
                APIFunctions.functions.fetchNotes()
            }
            
                   
                  
                   
        }
    }
}


extension NoteView: DataDelegate {
     func updateArray(newArray: String) {
        do {
            let decoder = JSONDecoder()
             notes = try decoder.decode([Note].self, from: newArray.data(using: .utf8)!)
            print (notes)
        } catch {
            print("failed to decode!")
        }
    }
}

#Preview {
    NoteView()
}
