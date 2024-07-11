//
//  ContentView.swift
//  Note-App
//
//  Created by Ayush S on 2024-07-10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
                   
                    NavigationLink("This is screen number 1") {
                     Text("Go to screen 1")
                            
                    }.navigationTitle("Notes.")
                           .toolbar{
                               ToolbarItem() {
                                                          NavigationLink(
                                                               destination: Text("Screen 2"),
                                                               label: {
                                                                  Image(systemName: "plus")
                                                              }
                                                          )
                                                      }

                           }.toolbarBackground(.visible)
                    Spacer().frame(height: 10)
                    NavigationLink("This is screen number 2") {
                     Text("Go to screen 2")
                    }
                   
        }
            }

}

#Preview {
    ContentView()
}
