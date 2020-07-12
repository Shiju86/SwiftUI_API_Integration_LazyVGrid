//
//  ImageDownloader.swift
//  SwiftUI API
//
//  Created by Shiju Varghese on 12/07/20.
//

import Foundation

class ImageDownloader: ObservableObject {
    
    @Published var downloadData: Data?
    
    func downloadImage(url: String) {
        
        guard let imageURL = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.downloadData = data
            }
        }.resume()
    }
        
        
}
