
import SwiftUI

struct CharacterDetailView: View {
    
    let character: Character
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            SpaceGradientBackground()

            ScrollView(.vertical, showsIndicators: false) {
                NavigationLink(destination: FullScreenImageView(model: character)) {
                    MainImageView(model: character)
                }
                
                VStack (alignment: .leading, spacing: 5) {
                    
                    Text(character.name)
                        .font(.largeTitle)
                    Text("Status: \(character.status)")
                    
                    Text("Species: \(character.species ?? "Unknown")")
                    
                    Text("Gender: \(character.gender)")
                    
                    Text("Hair: \(character.hair)")
                    
                    Text("Alias: \(character.alias?.joined(separator: ", ") ?? "Unknown")")
                    
                    Text("Origin: \(character.origin)")
                    
                    Text("Abilities: \(character.abilities.joined(separator: ", "))")
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
    CharacterDetailView(character: Character(id: 0, name: "Name", status: "Status", species: "Species", gender: "Gender", hair: "Hair", alias: ["Alias"], origin: "Origin", abilities: ["Abilities"], imgURL: "ImgURL"))
}
