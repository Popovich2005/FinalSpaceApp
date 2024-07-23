import SwiftUI

struct EpisodeDetailView: View {
    
    let episode: Episode
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            SpaceGradientBackground()
            
            ScrollView(.vertical, showsIndicators: false) {
                NavigationLink(destination: FullScreenImageView(model: episode)) {
                    MainImageView(model: episode)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(episode.name)
                        .font(.largeTitle)
                    Text("Air Date: \(episode.airDate)")
                        .font(.title3)
                    Text("Director: \(episode.director)")
                        .font(.title3)
                    Text("Writer: \(episode.writer.rawValue)")
                        .font(.title3)
                    Text("Characters:")
                        .font(.title3)
                    Text(episode.characters.map { characterURLString in
                        guard let characterID = characterURLString.split(separator: "/").last,
                              let character = vm.charactersDict[Int(characterID) ?? 0] else { return "Character not found" }
                        
                        return character.name
                    }
                    .joined(separator: ", "))
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
        .foregroundStyle(.white)
    }
}

#Preview {
    let sampleEpisode = Episode(
        id: 1,
        name: "Sample Episode",
        airDate: "2024-07-18",
        director: "Sample Director",
        writer: .benBjelajac,
        characters: ["https://finalspaceapi.com/api/v0/character/1", "https://finalspaceapi.com/api/v0/character/2"],
        imgURL: "https://example.com/sample.jpg"
    )
    return EpisodeDetailView(episode: sampleEpisode)
        .environmentObject(ViewModel())
}
