import Foundation
import UIKit

enum HapticFeedbackType {
    case light, medium, heavy, soft, rigid, success, warning, error
}

class HapticGenerator {
   static func trigger(type: HapticFeedbackType) {
        switch type {
        case .light, .medium, .heavy, .soft, .rigid:
            let impactStyle: UIImpactFeedbackGenerator.FeedbackStyle
            switch type {
            case .light: impactStyle = .light
            case .medium: impactStyle = .medium
            case .heavy: impactStyle = .heavy
            case .soft: impactStyle = .soft
            case .rigid: impactStyle = .rigid
            default: return
            }
            let generator = UIImpactFeedbackGenerator(style: impactStyle)
            generator.prepare()
            generator.impactOccurred()
        case .success, .warning, .error:
            let notificationType: UINotificationFeedbackGenerator.FeedbackType
            switch type {
            case .success: notificationType = .success
            case .warning: notificationType = .warning
            case .error: notificationType = .error
            default: return
            }
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(notificationType)
        }
    }
}
