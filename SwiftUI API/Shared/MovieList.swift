//
//  MovieList.swift
//  SwiftUI API
//
//  Created by Shiju Varghese on 12/07/20.
//

import Foundation

/*
{"Search":[
 
 {
 "Title":"Batman: The Killing Joke",
 "Year":"2016",
 "imdbID":"tt4853102","
 Type":"movie",
 "Poster":"https://m.media-amazon.com/images/M/MV5BMTdjZTliODYtNWExMi00NjQ1LWIzN2MtN2Q5NTg5NTk3NzliL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg"},{"Title":"Batman: The Dark Knight Returns, Part 2","Year":"2013","imdbID":"tt2166834","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BYTEzMmE0ZDYtYWNmYi00ZWM4LWJjOTUtYTE0ZmQyYWM3ZjA0XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg"
 
 }
 */

import Foundation

struct MovieListResponse: Decodable {

    let movie: [Movie]

    private enum CodingKeys: String, CodingKey {
        case movie = "Search"
    }
}

struct Movie: Decodable {
    
    let title: String
    let imdbID: String
    let poster: String
      
    private enum CodingKeys: String, CodingKey {
        case imdbID
        case title = "Title"
        case poster = "Poster"
    }
}

class MovieList: ObservableObject {

    @Published var movies: [Movie]? = [Movie]()
    
    func getListOfMovies() {
        
        guard let url = URL(string: "http://www.omdbapi.com/?s=Batman&page=2&apikey=a9214dac") else {
            fatalError("Invalid URL")
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, error == nil else {
                return
            }
                        
            let responseMovies = try? JSONDecoder().decode(MovieListResponse.self, from: data)
            
            if let responseMovies = responseMovies {
                DispatchQueue.main.async {
                    self.movies = responseMovies.movie
                }
            }            
        }.resume()
    }
}
