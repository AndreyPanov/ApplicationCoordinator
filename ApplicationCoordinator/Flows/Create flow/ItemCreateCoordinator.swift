final class ItemCreateCoordinator: BaseCoordinator, ItemCreateCoordinatorOutput {
  
  var finishFlow: ((ItemList?)->())?
  
  private let factory: ItemCreateModuleFactory
  private let router: Router
  
  init(router: Router, factory: ItemCreateModuleFactory) {
    self.factory = factory
    self.router = router
  }
  
  override func start() {
    showCreate()
  }
  
  //MARK: - Run current flow's controllers
  
  private func showCreate() {
    let createItemOutput = factory.makeItemAddOutput()
    createItemOutput.onCompleteCreateItem = { [weak self] item in
      self?.finishFlow?(item)
    }
    createItemOutput.onHideButtonTap = { [weak self] in
      self?.finishFlow?(nil)
    }
    router.setRootModule(createItemOutput)
  }
}
