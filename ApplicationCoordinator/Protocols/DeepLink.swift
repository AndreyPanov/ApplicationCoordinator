protocol DeepLink: class {
  func proceedDeepLink(with option: DeepLinkOption)
}

typealias DeepLinkableCoordinator = Coordinator & DeepLink
