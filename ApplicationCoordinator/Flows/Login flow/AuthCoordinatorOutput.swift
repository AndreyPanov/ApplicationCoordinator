protocol AuthCoordinatorOutput: AnyObject {
  var finishFlow: (() -> Void)? { get set }
}
