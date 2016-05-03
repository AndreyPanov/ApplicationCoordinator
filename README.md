# ApplicationCoordinator
Based on the post about Application Coordinators [khanlou.com](http://khanlou.com/2015/10/coordinators-redux/) and Application Controller pattern description [martinfowler.com](http://martinfowler.com/eaaCatalog/applicationController.html).
My presentation and problem’s explanation: [speakerdeck.com](https://speakerdeck.com/andreypanov/introducing-application-coordinator)
My example provides very basic structure with 3 controllers and 3 coordinators.
![](/str.jpg)

I created a protocol for coordinators:
```swift
typealias CoordinatorHandler = () -> ()

protocol Coordinatable: class, Router {
    
    var flowCompletionHandler: CoordinatorHandler? {get set}
    func start()
}
```
And a protocol for controllers:
```swift
protocol FlowController: NSObjectProtocol {
    
    associatedtype T //enum Actions type
    var completionHandler: (T -> ())? {get set}
}
```
All controllers and coordinators have optional completionHandlers.
```swift
var completionHandler: (T -> ())?
```
The base coordinator stores dependancies of child coordinators
```swift
class BaseCoordinator: Coordinatable {
    
    var flowCompletionHandler:CoordinatorHandler?
    var childCoordinators: [Coordinatable] = []
    private(set) weak var presenter: UINavigationController?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        fatalError("must be overriden")
    }
    
    func addDependancy(coordinator: Coordinatable) {
        childCoordinators.append(coordinator)
    }
    
    func removeDependancy(coordinator: Coordinatable) {
        guard childCoordinators.isEmpty == false else { return }
        
        for (index, element) in childCoordinators.enumerate() {
            if unsafeAddressOf(element) == unsafeAddressOf(coordinator) {
                childCoordinators.removeAtIndex(index)
            }
        }
    }
}
```
AppDelegate store lazy reference for the Application Coordinator
```swift
private lazy var applicationCoordinator: ApplicationCoordinator = {
        return ApplicationCoordinator(presenter: self.window!.rootViewController as! UITabBarController)
    }()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        applicationCoordinator.start()
        return true
    }
```