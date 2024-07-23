
import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ViewModel()
    @State private var searchText = ""
    
    var body: some View {
        
        TabView {
            
            CharacterView(vm: vm, searchText: $searchText)
                .tabItem {
                    Label("Characters", systemImage: "person.2.fill")
                }
            
            EpisodesView(vm: vm)
                .tabItem {
                    Label("Episodes", systemImage: "list.bullet")
                }
            
            LocationsView(vm: vm)
                .tabItem {
                    Label("Locations", systemImage: "location")
                }
            
            QuotesView(vm: vm)
                .tabItem {
                    Label("Quotes", systemImage: "quote.bubble")
                }
        }
        .environmentObject(vm)
    }
}

#Preview {
    ContentView(vm: ViewModel())
}
