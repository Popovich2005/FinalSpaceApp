import SwiftUI

struct EpisodeDetailView: View {
    
    let episode: Episode
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            ScrollView(.vertical, showsIndicators: false) {
                NavigationLink(destination: FullScreenImageView(model: episode)) {
                    MainImageView(model: episode)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(episode.name)
                        .font(.largeTitle)
//                        .padding(.bottom, 5)
                    Text("Air Date: \(episode.airDate)")
                        .font(.title3)
//                        .padding(.bottom, 5)
                    Text("Director: \(episode.director)")
                        .font(.title3)
//                        .padding(.bottom, 5)
                    Text("Writer: \(episode.writer.rawValue)")
                        .font(.title3)
//                        .padding(.bottom, 5)
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
    }
}
