@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var rootController: UINavigationController {
    return self.window!.rootViewController as! UINavigationController
  }
  
  private lazy var applicationCoordinator: Coordinator = self.makeCoordinator()
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    //run deep link
    //parse ApplicationLaunchOptions and extract deep link keys
    let deepLink = DeepLinkOption.build(with: DeepLinkURLConstants.Onboarding, params: nil)
    applicationCoordinator.start(with: deepLink)
    return true
  }
  
  private func makeCoordinator() -> Coordinator {
      return ApplicationCoordinator(
        router: RouterImp(rootController: self.rootController),
        coordinatorFactory: CoordinatorFactoryImp()
      )
  }
  
  //MARK: Handle push notifications and deep links
  func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
    //parse userInfo
    //run deep link
    //applicationCoordinator.start(with: deepLink)
  }
  
  func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
    //parse NSUserActivity
    //run deep link
    //applicationCoordinator.start(with: deepLink)
    return true
  }
}
