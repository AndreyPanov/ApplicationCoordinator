final class CoordinatorFactoryImp: CoordinatorFactory {
  
  func makeTabbarCoordinator() -> (configurator: Coordinator, toPresent: Presentable?) {
    let controller = TabbarController.controllerFromStoryboard(.main)
    let coordinator = TabbarCoordinator(tabbarView: controller, coordinatorFactory: CoordinatorFactoryImp())
    return (coordinator, controller)
  }
  
  func makeAuthCoordinatorBox(router: Router) -> Coordinator & AuthCoordinatorOutput {
    
    let coordinator = AuthCoordinator(router: router, factory: ModuleFactoryImp())
    return coordinator
  }
  
  func makeItemCoordinator() -> Coordinator {
    return makeItemCoordinator(navController: nil)
  }
  
  func makeItemCoordinator(navController: UINavigationController?) -> Coordinator {
    let coordinator = ItemCoordinator(
      router: router(navController),
      factory: ModuleFactoryImp(),
      coordinatorFactory: CoordinatorFactoryImp()
    )
    return coordinator
  }
  
  func makeSettingsCoordinator() -> Coordinator {
    return makeSettingsCoordinator(navController: nil)
  }
  
  func makeSettingsCoordinator(navController: UINavigationController? = nil) -> Coordinator {
    let coordinator = SettingsCoordinator(router: router(navController), factory: ModuleFactoryImp())
    return coordinator
  }
  
  func makeItemCreationCoordinatorBox() ->
    (configurator: Coordinator & ItemCreateCoordinatorOutput,
    toPresent: Presentable?) {
      
      return makeItemCreationCoordinatorBox(navController: navigationController(nil))
  }
  func makeItemCreationCoordinatorBox(navController: UINavigationController?) ->
    (configurator: Coordinator & ItemCreateCoordinatorOutput,
    toPresent: Presentable?) {
      
      let router = self.router(navController)
      let coordinator = ItemCreateCoordinator(router: router, factory: ModuleFactoryImp())
      return (coordinator, router)
  }
  
  private func router(_ navController: UINavigationController?) -> Router {
    return RouterImp(rootController: navigationController(navController))
  }
  
  private func navigationController(_ navController: UINavigationController?) -> UINavigationController {
    if let navController = navController { return navController }
    else { return UINavigationController.controllerFromStoryboard(.main) }
  }
}
