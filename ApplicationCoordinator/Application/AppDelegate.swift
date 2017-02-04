@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var rootController: UINavigationController {
    return self.window!.rootViewController as! UINavigationController
  }
  
  private lazy var applicationCoordinator: Coordinator = self.makeCoordinator()()
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    applicationCoordinator.start()
    return true
  }
  
  private func makeCoordinator() -> (() -> Coordinator) {
    return {
      return ApplicationCoordinator(
        router: RouterImp(rootController: self.rootController),
        coordinatorFactory: CoordinatorFactoryImp()
      )
    }
  }
}
