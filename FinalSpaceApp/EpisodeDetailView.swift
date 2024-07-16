//
//  EpisodeDetailView.swift
//  FinalSpaceApp
//
//  Created by Алексей Попов on 16.07.2024.
//

import SwiftUI

struct EpisodeDetailView: View {
    
    let episode: Episode
    
    //    var body: some View {
    //        VStack(alignment: .leading) {
    //            Text(episode.name)
    //                .font(.largeTitle)
    //                .padding(.bottom, 10)
    //            Text("Air Date: \(episode.airDate)")
    //                .font(.title2)
    //                .padding(.bottom, 10)
    //            Text("Director: \(episode.director)")
    //                .font(.title3)
    //                .padding(.bottom, 10)
    //            Text("Writer: \(episode.writer.rawValue)")
    //                .font(.title3)
    //                .padding(.bottom, 10)
    //            Text("Characters:")
    //                .font(.headline)
    //                .padding(.bottom, 5)
    //            ForEach(episode.characters, id: \.self) { character in
    //                Text(character)
    //                    .font(.body)
    //            }
    //            Spacer()
    //        }
    //        .padding()
    //        .navigationTitle("Episode Details")
    //    }
    //}
    
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            ScrollView(.vertical, showsIndicators: false) {
                NavigationLink(destination: FullScreenImageView(model: episode)) {
                    MainImageView(model: episode)
                }
                
                VStack (alignment: .leading, spacing: 10) {
                    
                    Text(episode.name)
                        .font(.largeTitle)
                        .padding(.bottom, 10)
                    Text("Air Date: \(episode.airDate)")
                        .font(.title2)
                        .padding(.bottom, 10)
                    Text("Director: \(episode.director)")
                        .font(.title3)
                        .padding(.bottom, 10)
                    Text("Writer: \(episode.writer.rawValue)")
                        .font(.title3)
                        .padding(.bottom, 10)
                    Text("Characters:")
                        .font(.headline)
                        .padding(.bottom, 5)
                    ForEach(episode.characters, id: \.self) { character in
                        Text(character)
                            .font(.body)
                    }
                    Spacer()
                    
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(GradientAvatarView())
                
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            
            BackButtonView()
                .padding()
            
        }
    }
}

