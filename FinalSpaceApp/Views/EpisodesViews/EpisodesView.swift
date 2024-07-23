
import SwiftUI

struct EpisodesView: View {
    
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        NavigationStack{
            ZStack {
                SpaceGradientBackground()

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
                                            .padding(.bottom, 10)
                                        Text(episode.airDate)
                                            .font(.subheadline)
                                    }
                                    .padding()
                                }
                                
                                Divider()
                                    .padding(.leading) 
                            }
                            .padding()
                            .frame(height: 110)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .navigationTitle("Episodes")
            }
            .foregroundStyle(.white)
        }
    }
}


#Preview {
    EpisodesView(vm: ViewModel())
}
