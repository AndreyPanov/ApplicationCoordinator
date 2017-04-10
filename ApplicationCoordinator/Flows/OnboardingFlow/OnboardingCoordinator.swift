class OnboardingCoordinator: BaseCoordinator, OnboardingCoordinatorOutput {

  var finishFlow: (() -> Void)?
  
  private let factory: OnboardingModuleFactory
  private let router: Router
  
  init(with factory: OnboardingModuleFactory, router: Router) {
    self.factory = factory
    self.router = router
  }
  
  override func start() {
    showOnboarding()
  }
  
  func showOnboarding() {
    let onboardingModule = factory.makeOnboardingModule()
    onboardingModule.onFinish = { [weak self] in
      self?.finishFlow?()
    }
    router.setRootModule(onboardingModule.toPresent())
  }
}
