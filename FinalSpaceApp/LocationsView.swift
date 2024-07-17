//
//  LocationsView.swift
//  FinalSpaceApp
//
//  Created by Алексей Попов on 17.07.2024.
//

import SwiftUI

struct LocationsView: View {
    
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(vm.locations, id: \.id) { location in
                    NavigationLink(destination: LocationDetailView(location: location)) {
                        VStack(alignment: .leading) {
                            HStack {
                                AsyncImageView(model: location)
                                    .frame(width: 100, height: 100)
                                VStack(alignment: .leading) {
                                    Text(location.name)
                                        .font(.title3)
//                                        .fixedSize(horizontal: false, vertical: true)
                                        .padding(.bottom, 10)
                                    Text(location.type)
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
            .navigationTitle("Locations")
        }
    }
}
#Preview {
    LocationsView(vm: ViewModel())
}
