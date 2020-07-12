//
//  ImageView.swift
//  SwiftUI API
//
//  Created by Shiju Varghese on 12/07/20.
//

import SwiftUI

struct ImageView: View {
    
    let url: String
    let placeholder: String
    
    @ObservedObject var imageDownloaded = ImageDownloader()
    
    init(url: String, placeholder: String = "photo") {
        self.url = url
        self.placeholder = placeholder
        self.imageDownloaded.downloadImage(url: self.url)
    }
    
    var body: some View {
        
        guard let data = self.imageDownloaded.downloadData else {
            
            return Image(systemName: "photo").renderingMode(.original).resizable()
        }
        
        return Image(uiImage: UIImage(data: data)!).renderingMode(.original).resizable()
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: "https://m.media-amazon.com/images/M/MV5BYTEzMmE0ZDYtYWNmYi00ZWM4LWJjOTUtYTE0ZmQyYWM3ZjA0XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg")
    }
}
