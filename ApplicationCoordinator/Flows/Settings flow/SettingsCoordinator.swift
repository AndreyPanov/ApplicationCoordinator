final class SettingsCoordinator: BaseCoordinator {
  
  private let factory: SettingsModuleFactory
  private let router: Router
  
  init(router: Router, factory: SettingsModuleFactory) {
    self.factory = factory
    self.router = router
  }
  
  override func start() {
    showSettings()
  }
  
  //MARK: - Run current flow's controllers
  
  private func showSettings() {
    let settingsFlowOutput = factory.makeSettingsOutput()
    router.setRootModule(settingsFlowOutput)
  }
}
