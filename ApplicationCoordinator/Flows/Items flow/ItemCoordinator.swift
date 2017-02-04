final class ItemCoordinator: BaseCoordinator {
  
  private let factory: ItemModuleFactory
  private let coordinatorFactory: CoordinatorFactory
  private let router: Router
  
  init(router: Router, factory: ItemModuleFactory, coordinatorFactory: CoordinatorFactory) {
    self.router = router
    self.factory = factory
    self.coordinatorFactory = coordinatorFactory
  }
  
  override func start() {
    showItemList()
  }
  
  //MARK: - Run current flow's controllers
  
  private func showItemList() {
    
    let itemsOutput = factory.makeItemsOutput()
    itemsOutput.onItemSelect = { [weak self] (item) in
      self?.showItemDetail(item)
    }
    itemsOutput.onCreateItem = { [weak self] in
      self?.runCreationFlow()
    }
    router.setRootModule(itemsOutput)
  }
  
  private func showItemDetail(_ item: ItemList) {
    
    let itemDetailFlowOutput = factory.makeItemDetailOutput(item: item)
    router.push(itemDetailFlowOutput)
  }
  
  //MARK: - Run coordinators (switch to another flow)
  
  private func runCreationFlow() {
    
    let (coordinator, module) = coordinatorFactory.makeItemCreationCoordinatorBox()
    coordinator.finishFlow = { [weak self, weak coordinator] item in
      
      self?.router.dismissModule()
      self?.removeDependency(coordinator)
      if let item = item {
        self?.showItemDetail(item)
      }
    }
    addDependency(coordinator)
    router.present(module)
    coordinator.start()
  }
}
