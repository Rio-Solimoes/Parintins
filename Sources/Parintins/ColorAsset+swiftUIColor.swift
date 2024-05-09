import Foundation
import SwiftUI

public extension ColorAsset {
    @available(iOS 14.0, macOS 11.0, *)
    var swiftUIColor: SwiftUI.Color {
        get {
            SwiftUI.Color(self.color.cgColor)
        }
    }
}
