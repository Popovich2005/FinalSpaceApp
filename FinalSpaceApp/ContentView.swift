
import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ViewModel()
    @State private var searchText = ""
    
    var filteredCharacters: [Character] {
        if searchText.isEmpty {
            return vm.characters
        } else {
            return vm.characters.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        TabView {
            HomeView(vm: vm, searchText: $searchText)
                .tabItem {
                    Label("Characters", systemImage: "house")
                }
            
            EpisodesView(vm: vm)
                .tabItem {
                    Label("Episodes", systemImage: "list.bullet")
                }
            
            LocationsView(vm: vm)
                .tabItem {
                    Label("Locations", systemImage: "location")
                }
        }
        .environmentObject(vm)
    }
}

#Preview {
    ContentView(vm: ViewModel())
}
