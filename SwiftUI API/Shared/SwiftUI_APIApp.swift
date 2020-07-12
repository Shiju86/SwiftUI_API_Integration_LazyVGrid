//
//  SwiftUI_APIApp.swift
//  Shared
//
//  Created by Shiju Varghese on 12/07/20.
//

import SwiftUI

@main
struct SwiftUI_APIApp: App {
    
    // Crate a one copy of MovieList
    @StateObject var movieList = MovieList()
    
    var body: some Scene {
        WindowGroup {
            ContentView(movieList: movieList)
        }
    }
}

struct SwiftUI_APIApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
