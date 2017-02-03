fileprivate var tutorialWasShown = false
fileprivate var isAutorized = false

fileprivate enum LaunchInstructor {
  case main, auth, tutorial
  
  static func configure(
    tutorialWasShown: Bool = tutorialWasShown,
    isAutorized: Bool = isAutorized) -> LaunchInstructor {
    
    switch (tutorialWasShown, isAutorized) {
      case (true, false), (false, false): return .auth
      case (false, true): return .tutorial
      case (true, true): return .main
    }
  }
}

final class ApplicationCoordinator: BaseCoordinator, DeepLink {
  
  private var instructor: LaunchInstructor {
    return LaunchInstructor.configure()
  }
  
  override init() {
    
  }
  
  override func start() {
    
    switch instructor {
      case .auth: runAuthFlow()
      case .tutorial: runTutorialFlow()
      case .main: runMainFlow()
    }
  }
  
  private func runAuthFlow() {
    
  }
  
  private func runTutorialFlow() {
    
  }
  
  private func runMainFlow() {
    
  }
  
  func proceedDeepLink(with option: DeepLinkOption) {
    
  }
}
