

import SwiftUI

struct LocationDetailView: View {
    
    let location: Location
    let vm: ViewModel
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            SpaceGradientBackground()

            ScrollView{
                NavigationLink(destination: FullScreenImageView(model: location)) {
                    MainImageView(model: location)
                }
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(location.name)
                        .font(.largeTitle)
                    Text("Type: \(location.type)")
                        .font(.title3)
                    Text("Inhabitants: \(location.inhabitants.map { String($0) }.joined(separator: ", "))")
                        .font(.title3)

                    Text("Notable Residents: " + location.notableResidents.map { characterURLString in
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

