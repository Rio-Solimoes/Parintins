// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Theme Manager

@available(macOS 14.0, *)
public class ThemeManager: ObservableObject {
    @Published public var selectedTheme: Theme {
        didSet {
            UserDefaults.standard.set(selectedTheme.userDefaultsValue, forKey: "selectedThemeName")
        }
    }
    
    public init() {
        guard let selectedThemeName = UserDefaults.standard.string(forKey: "selectedThemeName"),
              let selectedTheme = ThemeManager.getTheme(named: selectedThemeName) else {
            self.selectedTheme = Themes.defaultTheme
            return
        }
        self.selectedTheme = selectedTheme
    }
    
    private static func getTheme(named name: String) -> Theme? {
        return Themes.allThemes.first(where: { $0.name == name })?.theme
    }
}

// MARK: - Theme Protocol

public protocol Theme {
  var userDefaultsValue: String { get }
  var menu: ImageAsset { get }
  var orders: ImageAsset { get }
  var primary: ColorAsset { get }
  var profileDefault: ImageAsset { get }
  var search: ImageAsset { get }
  var secondary: ColorAsset { get }
}

// MARK: - Theme Assets

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum Themes {
  public static let allThemes: [(name: String, theme: Theme)] = [
    ("Caprichoso", Caprichoso.shared),
    ("Garantido", Garantido.shared),
    ("Parintins", Parintins.shared),
  ]
  public static let defaultTheme: Theme = Parintins.shared

  public struct Caprichoso: Theme {
    public static let shared = Caprichoso()

    public let userDefaultsValue = "Caprichoso"

    public let menu = ImageAsset(name: "Caprichoso/menu")
    public let orders = ImageAsset(name: "Caprichoso/orders")
    public let primary = ColorAsset(name: "Caprichoso/primary")
    public let profileDefault = ImageAsset(name: "Caprichoso/profileDefault")
    public let search = ImageAsset(name: "Caprichoso/search")
    public let secondary = ColorAsset(name: "Caprichoso/secondary")
  }
  public struct Garantido: Theme {
    public static let shared = Garantido()

    public let userDefaultsValue = "Garantido"

    public let menu = ImageAsset(name: "Garantido/menu")
    public let orders = ImageAsset(name: "Garantido/orders")
    public let primary = ColorAsset(name: "Garantido/primary")
    public let profileDefault = ImageAsset(name: "Garantido/profileDefault")
    public let search = ImageAsset(name: "Garantido/search")
    public let secondary = ColorAsset(name: "Garantido/secondary")
  }
  public struct Parintins: Theme {
    public static let shared = Parintins()

    public let userDefaultsValue = "Parintins"

    public let menu = ImageAsset(name: "Parintins/menu")
    public let orders = ImageAsset(name: "Parintins/orders")
    public let primary = ColorAsset(name: "Parintins/primary")
    public let profileDefault = ImageAsset(name: "Parintins/profileDefault")
    public let search = ImageAsset(name: "Parintins/search")
    public let secondary = ColorAsset(name: "Parintins/secondary")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

