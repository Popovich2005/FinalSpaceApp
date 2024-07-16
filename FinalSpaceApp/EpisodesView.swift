//
//  EpisodesView.swift
//  FinalSpaceApp
//
//  Created by Алексей Попов on 16.07.2024.
//

import SwiftUI

struct EpisodesView: View {
    
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        NavigationView{
            ScrollView {
                ForEach(vm.episodes, id: \.id) { episode in
                    NavigationLink(destination: EpisodeDetailView(episode: episode)) {
                        VStack(alignment: .leading) {
                            HStack {
                                AsyncImageView(model: episode)
                                    .frame(width: 100, height: 100)
                                VStack(alignment: .leading) {
                                    Text(episode.name)
                                        .font(.title3)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .padding(.bottom, 10)
                                    Text(episode.airDate)
                                        .font(.subheadline)
                                }
                                .padding()
                            }
                            
                            Divider() // Разделитель между элементами
                                .padding(.leading) // Отступ слева для разделителя
                        }
                        .padding()
                        .frame(height: 110)
                    }
                    .buttonStyle(.plain)
                }
            }
            .navigationTitle("Episodes")
        }
    }
}



