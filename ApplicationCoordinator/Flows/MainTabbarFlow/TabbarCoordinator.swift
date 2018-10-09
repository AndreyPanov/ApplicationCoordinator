class TabbarCoordinator: BaseCoordinator {
  
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
    return { [unowned self] navController in
      if navController.viewControllers.isEmpty == true {
        let itemCoordinator = self.coordinatorFactory.makeItemCoordinator(navController: navController)
        itemCoordinator.start()
        self.addDependency(itemCoordinator)
      }
    }
  }
  
  private func runSettingsFlow() -> ((UINavigationController) -> ()) {
    return { [unowned self] navController in
      if navController.viewControllers.isEmpty == true {
        let settingsCoordinator = self.coordinatorFactory.makeSettingsCoordinator(navController: navController)
        settingsCoordinator.start()
        self.addDependency(settingsCoordinator)
      }
    }
  }
}
