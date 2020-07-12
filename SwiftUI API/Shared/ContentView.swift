//
//  ContentView.swift
//  Shared
//
//  Created by Shiju Varghese on 12/07/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var movieList: MovieList
    
    let columns:[GridItem] = Array(repeating:.init(.flexible()), count: 3)
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                //LazyVGrid
                LazyVGrid(columns: columns) {
                    
                    ForEach(movieList.movies ?? [Movie](), id: \.imdbID) { movie in
                        
                        NavigationLink(destination: Text(movie.title)) {
                            
                            VStack {
                                
                                ImageView(url: movie.poster)
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                
                                Text(movie.title)
                                    .frame(maxHeight: .infinity, alignment: .top)
                                
                            }
                        }

                    }
                }
            }
            .navigationTitle("Movies")
        }
        
        .onAppear() {
            
            movieList.getListOfMovies()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(movieList: MovieList())
    }
}
