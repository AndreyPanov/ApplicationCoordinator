@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var rootController: UINavigationController {
    return self.window!.rootViewController as! UINavigationController
  }
  
  private lazy var applicationCoordinator: DeepLinkableCoordinator = self.makeCoordinator()()
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    //run deep link
    //parse ApplicationLaunchOptions and extract deep link keys
    if let deepLink = DeepLinkOption.build(with: DeepLinkURLConstants.Onboarding, params: nil) {
      applicationCoordinator.proceedDeepLink(with: deepLink)
    } else {
      //default behavior, just call start method
      applicationCoordinator.start()
    }
    return true
  }
  
  private func makeCoordinator() -> (() -> DeepLinkableCoordinator) {
    return {
      return ApplicationCoordinator(
        router: RouterImp(rootController: self.rootController),
        coordinatorFactory: CoordinatorFactoryImp()
      )
    }
  }
  
  //MARK: Handle push notifications and deep links
  func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
    //parse userInfo
    //run deep link
    //applicationCoordinator.proceedDeepLink(with: deepLink)
  }
  
  func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
    //parse NSUserActivity
    //run deep link
    //applicationCoordinator.proceedDeepLink(with: deepLink)
    return true
  }
}
