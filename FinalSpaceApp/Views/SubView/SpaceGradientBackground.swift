
import SwiftUI

struct SpaceGradientBackground: View {
    
    var body: some View {
        ZStack {
            
            LinearGradient(
                gradient: Gradient(colors: [Color.black, Color.blue, Color.purple, Color.black]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.purple.opacity(0.8)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .blendMode(.overlay)
            .edgesIgnoringSafeArea(.all)
            
            RadialGradient(
                gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.5)]),
                center: .center,
                startRadius: 0,
                endRadius: 600
            )
            .blendMode(.overlay)
            .edgesIgnoringSafeArea(.all)
            
            StarsView()
        }
    }
}

struct StarsView: View {
    var body: some View {
        GeometryReader { geometry in
            let stars = (0..<200).map { _ in
                Star(
                    position: StarPosition(
                        x: CGFloat.random(in: 0...geometry.size.width),
                        y: CGFloat.random(in: 0...geometry.size.height)
                    ),
                    size: CGFloat.random(in: 1...3),
                    opacity: Double.random(in: 0.5...1.0)
                )
            }
            
            ForEach(stars) { star in
                Circle()
                    .fill(Color.white)
                    .frame(width: star.size, height: star.size)
                    .position(x: star.position.x, y: star.position.y)
                    .opacity(star.opacity)
            }
        }
        .blendMode(.screen)
    }
}

#Preview {
    SpaceGradientBackground()
}
