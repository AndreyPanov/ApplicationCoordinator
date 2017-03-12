protocol Coordinator: class {
  func start()
  func deepLinkableCoordinator() -> DeepLinkableCoordinator?
}

extension Coordinator {
  func deepLinkableCoordinator() -> DeepLinkableCoordinator? {
    return self as? DeepLinkableCoordinator
  }
}
