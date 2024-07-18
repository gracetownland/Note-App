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

     var notes = [Note]()
    init() {
        APIFunctions.functions.delegate = self
        APIFunctions.functions.fetchNotes()
    }
    
    var body: some View {
        
        NavigationStack {
            List{
                ForEach(notes, id: \.self) { note in
                    NavigationLink(note.title) {
                     Text("Go to screen 1")
                    }.navigationTitle("Notes.")
                           
                  
                      }
                
            }
            
                   
                  
                   
        }
    }
}


extension NoteView: DataDelegate {
    func updateArray(newArray: String) {
        do {
            let decoder = JSONDecoder()
            var notesArray = try decoder.decode([Note].self, from: newArray.data(using: .utf8)!)
            print (notesArray)
        } catch {
            print("failed to decode!")
        }
    }
}

#Preview {
    NoteView()
}
