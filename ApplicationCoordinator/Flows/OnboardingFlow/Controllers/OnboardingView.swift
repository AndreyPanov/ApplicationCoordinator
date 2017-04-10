protocol OnboardingView: BaseView {
  var onFinish: (() -> Void)? { get set }
}
