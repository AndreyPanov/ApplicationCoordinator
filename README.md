# ApplicationCoordinator
A lot of developers need to change navigation flow frequently, because it depends on business tasks. And they spend a huge amount of time for re-writing code. In this approach, I demonstrate our implementation of Coordinators, the creation of a protocol-oriented, testable architecture written on pure Swift without the downcast and, also to avoid the violation of the S.O.L.I.D. principles.

Based on the post about Application Coordinators [khanlou.com](http://khanlou.com/2015/10/coordinators-redux/) and Application Controller pattern description [martinfowler.com](http://martinfowler.com/eaaCatalog/applicationController.html).


### Coordinators Essential tutorial. Part I [medium.com](https://medium.com/blacklane-engineering/coordinators-essential-tutorial-part-i-376c836e9ba7)

### Coordinators Essential tutorial. Part II [medium.com](https://medium.com/@panovdev/coordinators-essential-tutorial-part-ii-b5ab3eb4a74)


Example provides very basic structure with 6 controllers and 5 coordinators with mock data and logic.
![](/str.jpg)

I used a protocol for coordinators in this example:
```swift
protocol Coordinator: class {
    func start()
    func start(with option: DeepLinkOption?)
}
```
All flow controllers have a protocols (we need to configure blocks and handle callbacks in coordinators):
```swift
protocol ItemsListView: BaseView {
    var authNeed: (() -> ())? { get set }
    var onItemSelect: (ItemList -> ())? { get set }
    var onCreateButtonTap: (() -> ())? { get set }
}
```
In this example I use factories for creating  coordinators and controllers (we can mock them in tests).
```swift
protocol CoordinatorFactory {
    func makeItemCoordinator(navController navController: UINavigationController?) -> Coordinator
    func makeItemCoordinator() -> Coordinator
    
    func makeItemCreationCoordinatorBox(navController: UINavigationController?) ->
        (configurator: Coordinator & ItemCreateCoordinatorOutput,
        toPresent: Presentable?)
}
```
The base coordinator stores dependencies of child coordinators
```swift
class BaseCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []

    func start() { }
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
```
AppDelegate store lazy reference for the Application Coordinator
```swift
var rootController: UINavigationController {
    return self.window!.rootViewController as! UINavigationController
  }
  
  private lazy var applicationCoordinator: Coordinator = self.makeCoordinator()
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    let notification = launchOptions?[.remoteNotification] as? [String: AnyObject]
    let deepLink = DeepLinkOption.build(with: notification)
    applicationCoordinator.start(with: deepLink)
    return true
  }
  
  private func makeCoordinator() -> Coordinator {
      return ApplicationCoordinator(
        router: RouterImp(rootController: self.rootController),
        coordinatorFactory: CoordinatorFactoryImp()
      )
  }
```
