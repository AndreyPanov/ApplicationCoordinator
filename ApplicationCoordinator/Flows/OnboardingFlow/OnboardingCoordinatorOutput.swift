protocol OnboardingCoordinatorOutput: class {
  var finishFlow: (() -> Void)? { get set }
}
