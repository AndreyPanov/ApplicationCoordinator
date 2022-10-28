protocol OnboardingCoordinatorOutput: AnyObject {
  var finishFlow: (() -> Void)? { get set }
}
