struct DeepLinkURLConstants {
  static let Items = "items"
  static let Item = "item"
  static let Settings = "settings"
  static let Login = "login"
  static let Terms = "terms"
  static let SignUp = "signUp"
}

enum DeepLinkOption {
  
  case items
  case settings
  case login
  case terms
  case signUp
  case item(String)
  
  static func build(with id: String, params: [String : AnyObject]?) -> DeepLinkOption? {
    
    let itemID = params?["item_id"] as? String ?? ""
    
    switch id {
      case DeepLinkURLConstants.Items: return .items
      case DeepLinkURLConstants.Item where itemID.isEmpty == false: return .item(itemID)
      case DeepLinkURLConstants.Settings: return .settings
      case DeepLinkURLConstants.Login: return .login
      case DeepLinkURLConstants.Terms: return .terms
      case DeepLinkURLConstants.SignUp: return .signUp
      default: return nil
    }
  }
}
