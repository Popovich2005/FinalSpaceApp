//
//  MainImageView.swift
//  FinalSpaceApp
//
//  Created by Алексей Попов on 13.07.2024.
//

import SwiftUI

struct MainImageView: View {
    
    let character: WelcomeElement

    
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
                    }
                }
            }
        }
        .frame(height: SizeConstants.avatarHeight)
    }
}
