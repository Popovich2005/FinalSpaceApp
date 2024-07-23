
import SwiftUI

struct LocationsView: View {
    
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                SpaceGradientBackground()
                ScrollView {
                    ForEach(vm.locations, id: \.id) { location in
                        NavigationLink(destination: LocationDetailView(location: location, vm: vm)) {
                            VStack(alignment: .leading) {
                                HStack {
                                    AsyncImageView(model: location)
                                        .frame(width: 100, height: 100)
                                    VStack(alignment: .leading) {
                                        Text(location.name)
                                            .font(.title3)
                                            .padding(.bottom, 10)
                                        Text(location.type)
                                            .font(.subheadline)
                                    }
                                    .padding()
                                }
                                
                                Divider()
                                    .padding(.leading) 
                            }
                            .padding()
                            .frame(height: 110)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .navigationTitle("Locations")
            }
            .foregroundStyle(.white)
        }
    }
}
#Preview {
    LocationsView(vm: ViewModel())
}
