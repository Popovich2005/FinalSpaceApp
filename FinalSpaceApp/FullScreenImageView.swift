//
//  FullScreenImageView.swift
//  FinalSpaceApp
//
//  Created by Алексей Попов on 15.07.2024.
//

import SwiftUI

struct FullScreenImageView<Model: HasImageURL>: View {
    
    let model: Model
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            Color.black.edgesIgnoringSafeArea(.all)
            
            if let urlStr = model.imgURL, let imageURL = URL(string: urlStr) {
                AsyncImage(url: imageURL) { phase in
                    phase
                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .ignoresSafeArea()
                } placeholder: {
                    ProgressView()
                }
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
                BackButtonView()
                .padding()
        }
        .navigationBarHidden(true)
    }
}
