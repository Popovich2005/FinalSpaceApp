
import SwiftUI

struct FullScreenImageView<Model: DownloadableImage>: View {
    
    let model: Model
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            Color.black.edgesIgnoringSafeArea(.all)
            
            if let urlStr = model.imgURL, let imageURL = URL(string: urlStr) {
                AsyncImage(url: imageURL) { phase in
                    phase
                        .resizable()
                        .ignoresSafeArea()
                } placeholder: {
                    ProgressView()
                }
            } else {
                ZStack {
                    Rectangle()
                        .frame(height: 100)
                        .foregroundStyle(.secondary)
                        .opacity(0.3)
                        .cornerRadius(10)
                    
                    Image(systemName: "photo")
                        .resizable()
                        .foregroundStyle(.secondary)
                        .scaledToFit()
                        .frame(height: 50)
                }
            }
                BackButtonView()
                .padding()
        }
        .navigationBarHidden(true)
    }
}
