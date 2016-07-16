# ApplicationCoordinator
A lot of developers need to change navigation flow frequently, because it depends on business tasks. And they spend a huge amount of time for re-writing code. In this approach, I demonstrate our implementation of Coordinators, the creation of a protocol-oriented, testable architecture written on pure Swift without the downcast and, also to avoid the violation of the S.O.L.I.D. principles.

Based on the post about Application Coordinators [khanlou.com](http://khanlou.com/2015/10/coordinators-redux/) and Application Controller pattern description [martinfowler.com](http://martinfowler.com/eaaCatalog/applicationController.html).

My presentation and problem’s explanation: [speakerdeck.com](https://speakerdeck.com/andreypanov/introducing-application-coordinators)

Example provides very basic structure with 6 controllers and 5 coordinators with mock data and logic.
![](/str.jpg)

I used a protocol for coordinators in this example:
```swift
protocol Coordinatable: class {
    func start()
}
```
All flow controllers have a protocols (we need to configure blocks and handle callbacks in coordinators):
```swift
protocol ItemsListFlowOutput: FlowControllerOutput {
    var authNeed: (() -> ())? { get set }
    var onItemSelect: (ItemList -> ())? { get set }
    var onCreateButtonTap: (() -> ())? { get set }
}
```
In this example I use factories for creating  coordinators and controllers (we can mock them in tests).
```swift
protocol CoordinatorFactory {
    func createItemCoordinator(navController navController: UINavigationController?) -> Coordinator
    func createItemCoordinator() -> Coordinator
    
    func createItemCreationCoordinatorBox(navController navController: UINavigationController?) ->
        (configurator: protocol<Coordinator, ItemCreateCoordinatorOutput>,
        toPresent: UIViewController?)
}
```
The base coordinator stores dependencies of child coordinators
```swift
class BaseCoordinator {
    
    var childCoordinators: [Coordinatable] = []
    
    func addDependency(coordinator: Coordinator) {
        
        for element in childCoordinators {
            if element === coordinator { return }
        }
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(coordinator: Coordinator?) {
        guard childCoordinators.isEmpty == false, let coordinator = coordinator else { return }
        
        for (index, element) in childCoordinators.enumerate() {
            if element === coordinator {
                childCoordinators.removeAtIndex(index)
                break
            }
        }
    }
}
```
AppDelegate store lazy reference for the Application Coordinator
```swift
private lazy var applicationCoordinator: Coordinator = {
        let tabbarFlowOutput = self.window!.rootViewController as! TabbarFlowOutput
        return ApplicationCoordinator(tabbarFlowOutput: tabbarFlowOutput,
                                      coordinatorFactory: CoordinatorFactoryImp())
    }()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        applicationCoordinator.start()
        return true
    }
```
