class BaseCoordinator: Coordinator {
  
  var childCoordinators: [Coordinator] = []
  
  func start() {
    start(with: nil)
  }
  
  func start(with option: DeepLinkOption?) { }
  
  // add only unique object
  func addDependency(_ coordinator: Coordinator) {
    for element in childCoordinators {
      if element === coordinator { return }
    }
    childCoordinators.append(coordinator)
  }
  
  func removeDependency(_ coordinator: Coordinator?) {
    guard
      childCoordinators.isEmpty == false,
      let coordinator = coordinator
      else { return }
    
    for (index, element) in childCoordinators.enumerated() {
      if element === coordinator {
        childCoordinators.remove(at: index)
        break
      }
    }
  }
}
