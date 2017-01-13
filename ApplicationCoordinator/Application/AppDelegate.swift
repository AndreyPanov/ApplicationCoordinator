@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  private lazy var applicationCoordinator: Coordinator = self.makeCoordinator()()
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    applicationCoordinator.start()
    return true
  }
  
  private func makeCoordinator() -> (() -> Coordinator) {
    return {
      return ApplicationCoordinator(
        tabbarView: self.window!.rootViewController as! TabbarView,
        coordinatorFactory: CoordinatorFactoryImp()
      )
    }
  }
}

