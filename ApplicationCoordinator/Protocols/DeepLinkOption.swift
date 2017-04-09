struct DeepLinkURLConstants {
  static let Onboarding = "onboarding"
  static let Items = "items"
  static let Item = "item"
  static let Settings = "settings"
  static let Login = "login"
  static let Terms = "terms"
  static let SignUp = "signUp"
}

enum DeepLinkOption {
  
  case onboarding
  case items
  case settings
  case login
  case terms
  case signUp
  case item(String?)
  
  static func build(with userActivity: NSUserActivity) -> DeepLinkOption? {
    if userActivity.activityType == NSUserActivityTypeBrowsingWeb,
      let url = userActivity.webpageURL,
      let _ = URLComponents(url: url, resolvingAgainstBaseURL: true) {
      //TODO: extract string and match with DeepLinkURLConstants
    }
    return nil
  }
  
  static func build(with dict: [String : AnyObject]?) -> DeepLinkOption? {
    guard let id = dict?["launch_id"] as? String else { return nil }
    
    let itemID = dict?["item_id"] as? String
    
    switch id {
      case DeepLinkURLConstants.Onboarding: return .onboarding
      case DeepLinkURLConstants.Items: return .items
      case DeepLinkURLConstants.Item: return .item(itemID)
      case DeepLinkURLConstants.Settings: return .settings
      case DeepLinkURLConstants.Login: return .login
      case DeepLinkURLConstants.Terms: return .terms
      case DeepLinkURLConstants.SignUp: return .signUp
      default: return nil
    }
  }
}
