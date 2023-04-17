import SwiftUI

struct FeelTheHaptics: View {
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            VStack(spacing: 60) {
                VStack(alignment: .center) {
                    Text("Feel The Haptics")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    Text("Touch sensations play a crucial role in enriching user interactions with digital interfaces. iOS offers eight pre-defined haptic feedback choices to augment these experiences.")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                
                LazyVGrid(columns: columns, spacing: 10) {
                    HapticButtonView(title: "Light Impact", subtitle: "A gentle tap", type: .light)
                    HapticButtonView(title: "Medium Impact", subtitle: "A slightly stronger tap", type: .medium)
                    HapticButtonView(title: "Heavy Impact", subtitle: "A firm and strong tap", type: .heavy)
                    HapticButtonView(title: "Soft Impact", subtitle: "A light, cushioned tap", type: .soft)
                    HapticButtonView(title: "Rigid Impact", subtitle: "A hard, uncompromising tap", type: .rigid)
                    HapticButtonView(title: "Success Notification", subtitle: "Indicates a successful operation", type: .success)
                    HapticButtonView(title: "Warning Notification", subtitle: "Indicates a warning or potential problem", type: .warning)
                    HapticButtonView(title: "Error Notification", subtitle: "Indicates an error or failure", type: .error)
                }
            }
            .padding()
        }
    }
}

struct FeelTheHaptics_Previews: PreviewProvider {
    static var previews: some View {
        FeelTheHaptics()
    }
}
