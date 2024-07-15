//
//  CharacterDetailView.swift
//  FinalSpaceApp
//
//  Created by Алексей Попов on 13.07.2024.
//

import SwiftUI

struct CharacterDetailView: View {
    
    let character: WelcomeElement
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            ScrollView(.vertical, showsIndicators: false) {
                MainImageView(character: character)
                
                VStack (alignment: .leading, spacing: 10) {
                    
                    Text(character.name)
                        .font(.largeTitle)
                        .padding()
                    
                    Text("Status: \(character.status)")
//                        .font(.title2)
                    
                    Text("Species: \(character.species ?? "Unknown")")
//                        .font(.title2)
                    
                    Text("Gender: \(character.gender)")
//                        .font(.title2)
                    Text("Hair: \(character.hair)")
                    
                    Text("Alias: \(character.alias?.joined(separator: ", ") ?? "Unknown")")
                    
                    Text("Origin: \(character.origin)")
//                        .font(.title2)
                    
                    Text("Abilities: \(character.abilities.joined(separator: ", "))")
//                        .font(.title2)
                    
                    
                    
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

#Preview {
    CharacterDetailView(character: WelcomeElement(id: 0, name: "Name", status: "Status", species: "Species", gender: "Gender", hair: "Hair", alias: ["Alias"], origin: "Origin", abilities: ["Abilities"], imgURL: "ImgURL"))
}
