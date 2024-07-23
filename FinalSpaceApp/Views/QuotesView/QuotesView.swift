
import SwiftUI

struct QuotesView: View {
    
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                SpaceGradientBackground()
                
                ScrollView {
                    ForEach(vm.quotes, id: \.id) { quote in
                        VStack(alignment: .leading) {
                            HStack {
                                AsyncImageView(model: quote)
                                    .frame(width: 100, height: 100)
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(quote.quote)
                                        .font(.subheadline)
                                        .lineLimit(nil)
                                        .fixedSize(horizontal: false, vertical: true)
                                    Text("By: \(quote.by)")
                                        .font(.subheadline)
                                        .bold()
                                }
                            }
                            Divider()
                                .padding(.leading)
                        }
                        .padding()
                        .frame(height: 110)
                    }
                    .buttonStyle(.plain)
                }
                .navigationTitle("Quotes")
                .foregroundStyle(.white)
            }
        }
        
    }
}

#Preview {
    QuotesView(vm: ViewModel())
}
