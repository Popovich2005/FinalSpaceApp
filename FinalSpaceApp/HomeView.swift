//
//  HomeView.swift
//  FinalSpaceApp
//
//  Created by Алексей Попов on 16.07.2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var vm: ViewModel
    @Binding var searchText: String
    
    var filteredCharacters: [Character] {
        if searchText.isEmpty {
            return vm.characters
        } else {
            return vm.characters.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("🔍 Введите Имя ", text: $searchText)
                        .padding(10)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(8)
                    
                    if !searchText.isEmpty {
                        Button(action: {
                            searchText = ""
                        }) {
                            Text("Cancel")
                                .foregroundColor(.blue)
                        }
                        .padding(.trailing, 10)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                if vm.characters.isEmpty {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else {
                    ScrollView {
                        ForEach(filteredCharacters, id: \.id) { character in
                            NavigationLink(destination: CharacterDetailView(character: character)) {
                                VStack(alignment: .leading) {
                                    HStack {
                                        AsyncImageView(model: character)
                                            .frame(width: 100, height: 100)
                                        VStack(alignment: .leading) {
                                            Text(character.name)
                                                .font(.title3)
                                                .padding(.bottom, 10)
                                            Text(character.status)
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
                }
            }
            .navigationTitle("Characters")
        }
    }
}


