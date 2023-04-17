import SwiftUI

struct HapticButtonView: View {
    
    let title: String
    let subtitle: String
    let type: HapticFeedbackType
    
    @State private var buttonScale: CGFloat = 1.0
    
    var body: some View {
        
        Button(action: {
            HapticGenerator.trigger(type: type)
            withAnimation(.easeInOut(duration: 0.1)) {
                buttonScale = 0.95
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0)) {
                    buttonScale = 1.0
                }
            }
        }) {
            VStack(alignment: .center) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .bold()
                Text(subtitle)
                    .font(.footnote)
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 150)
            .background(Color.black.opacity(0.1))
            .cornerRadius(10)
            .foregroundColor(.primary)
            .scaleEffect(buttonScale)
        }
    }
    
}

struct HapticButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HapticButtonView(title: "Test", subtitle: "Subtitle", type: .heavy)
    }
}
