//
//  AsyncImageView.swift
//  FinalSpaceApp
//
//  Created by Алексей Попов on 13.07.2024.
//

import SwiftUI

protocol HasImageURL {
    var imgURL: String? { get }
}

struct AsyncImageView<Model: HasImageURL>: View {
    
    // MARK: - Properties
    let model: Model
    
    // MARK: - Body
    var body: some View {
        if let urlStr = model.imgURL, let imageURL = URL(string: urlStr) {
            AsyncImage(url: imageURL) { phase in
                if  let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                } else {
                    ZStack {
                        Rectangle()
                            .frame(height: 100)
                            .foregroundStyle(.secondary)
                            .opacity(0.3)
                            .cornerRadius(10)
                        
                        Image(systemName: "photo")
                            .resizable()
                            .foregroundStyle(.secondary)
                            .scaledToFit()
                            .frame(height: 50)
                    }
                }
            }
        }
    }
}

extension Episode: HasImageURL {
    var imgURLEpisode: String? {
        return self.imgURL
    }
}

extension Character: HasImageURL {
    var imgURLCharacter: String? {
        return self.imgURL
    }
}
