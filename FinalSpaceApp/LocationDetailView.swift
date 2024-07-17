//
//  LocationDetailView.swift
//  FinalSpaceApp
//
//  Created by Алексей Попов on 17.07.2024.
//

import SwiftUI

struct LocationDetailView: View {
    
    let location: Location
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
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
                    Text("Notable Residents: \(location.notableResidents.map { String($0) }.joined(separator: ", "))")
                        .font(.title3)

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

//#Preview {
//    LocationDetailView(location: Location(from: <#Decoder#>))
//}
