
import SwiftUI

struct GradientAvatarView: View {
    var body: some View {
        GeometryReader { _ in
            LinearGradient(
                colors: [Color(UIColor.systemBackground), .clear],
                startPoint: .bottom,
                endPoint: .top
            )
            .frame(height: SizeConstants.avatarHeight / 3.8)
            .offset(y: -SizeConstants.avatarHeight / 4)
        }
    }
}
