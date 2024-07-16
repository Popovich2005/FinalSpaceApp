//
//  AsyncImageView.swift
//  FinalSpaceApp
//
//  Created by Алексей Попов on 13.07.2024.
//

import SwiftUI

struct AsyncImageView: View {
    
    // MARK: - Properties
    let character: Character
    
    // MARK: - Body
    var body: some View {
        if let url = character.imgURL, let imageURL = URL(string: url) {
            AsyncImage(url: imageURL) { phase in
                if  let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
//                        .frame(width: 100, height: 100)
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
struct AsyncEpisodeImageView: View {
    
    // MARK: - Properties
    let episode: Episode
    
    // MARK: - Body
    var body: some View {
        if let url = episode.imgURL, let imageURL = URL(string: url) {
            AsyncImage(url: imageURL) { phase in
                if  let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
//                        .frame(width: 100, height: 100)
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
