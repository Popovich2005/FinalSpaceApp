//
//  MainImageView.swift
//  FinalSpaceApp
//
//  Created by Алексей Попов on 13.07.2024.
//

import SwiftUI


struct MainImageView<Model: DownloadableImage>: View {
    
    let model: Model
    
    var body: some View {
        GeometryReader { reader in
            if let urlStr = model.imgURL, let imageURL = URL(string: urlStr) {
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
                                .frame(height: 400)
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

//extension Episode: HasImageURL {
//    var imgURLEpisode: String? {
//        return self.imgURL
//    }
//}
//
//extension Character: HasImageURL {
//    var imgURLCharacter: String? {
//        return self.imgURL
//    }
//}
