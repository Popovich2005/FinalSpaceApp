//
//  MainImageView.swift
//  FinalSpaceApp
//
//  Created by Алексей Попов on 13.07.2024.
//

import SwiftUI

struct MainImageView: View {
    
    let character: Character

    
    var body: some View {
        GeometryReader { reader in
            if let url = character.imgURL, let imageURL = URL(string: url) {
                AsyncImage(url: imageURL) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(y: -reader.frame(in: .global).minY)
                            .frame(
                                width: SizeConstants.screenWidth,
                                height: reader.frame(in: .global)
                                    .minY + SizeConstants.avatarHeight + 10
                            )
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
        .frame(height: SizeConstants.avatarHeight)
    }
}
