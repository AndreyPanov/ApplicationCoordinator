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
  
  private let coordinatorFactory: CoordinatorFactory
  private let router: Router
  
  private var instructor: LaunchInstructor {
    return LaunchInstructor.configure()
  }
  
  init(router: Router, coordinatorFactory: CoordinatorFactory) {
    self.router = router
    self.coordinatorFactory = coordinatorFactory
  }
  
  override func start() {
    
    switch instructor {
      case .auth: runAuthFlow()
      case .tutorial: runTutorialFlow()
      case .main: runMainFlow()
    }
  }
  
  private func runAuthFlow() {
    
    let coordinator = coordinatorFactory.makeAuthCoordinatorBox(router: router)
    coordinator.finishFlow = { [weak self, weak coordinator] in
      isAutorized = true
      tutorialWasShown = true
      self?.start()
      self?.removeDependency(coordinator)
    }
    addDependency(coordinator)
    coordinator.start()
  }
  
  private func runTutorialFlow() {
    
  }
  
  private func runMainFlow() {
    
    let (coordinator, module) = coordinatorFactory.makeTabbarCoordinator()
    addDependency(coordinator)
    router.setRootModule(module)
    coordinator.start()
  }
  
  func proceedDeepLink(with option: DeepLinkOption) {
    
  }
}
