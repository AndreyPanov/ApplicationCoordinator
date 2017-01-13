fileprivate var tutorialWasShown = false
fileprivate var isAutorized = false

fileprivate enum LaunchInstructor {
  case main, auth, tutorial
  
  static func configureInstruction(
    tutorialWasShown: Bool = tutorialWasShown,
    isAutorized: Bool = isAutorized) -> LaunchInstructor {
    
    switch (tutorialWasShown, isAutorized) {
      case (true, false), (false, false): return .auth
      case (false, true): return .tutorial
      case (true, true): return .main
    }
  }
}

final class ApplicationCoordinator: BaseCoordinator {
  
  private let tabbarView: TabbarView
  private let coordinatorFactory: CoordinatorFactory
  
  init(tabbarView: TabbarView, coordinatorFactory: CoordinatorFactory) {
    self.tabbarView = tabbarView
    self.coordinatorFactory = coordinatorFactory
  }
  
  override func start() {
    tabbarView.onViewDidLoad = runItemFlow()
    tabbarView.onItemFlowSelect = runItemFlow()
    tabbarView.onSettingsFlowSelect = runSettingsFlow()
  }
  
  private func runItemFlow() -> ((UINavigationController) -> ()) {
    return { navController in
      if navController.viewControllers.isEmpty == true {
        let itemCoordinator = self.coordinatorFactory.makeItemCoordinator(navController: navController)
        itemCoordinator.start()
        self.addDependency(itemCoordinator)
      }
    }
  }
  
  private func runSettingsFlow() -> ((UINavigationController) -> ()) {
    return { navController in
      if navController.viewControllers.isEmpty == true {
        let settingsCoordinator = self.coordinatorFactory.makeSettingsCoordinator(navController: navController)
        settingsCoordinator.start()
        self.addDependency(settingsCoordinator)
      }
    }
  }
}
