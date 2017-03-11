protocol SignUpView: BaseView {
  
  var confirmed: Bool { get set }
  var onSignUpComplete: (() -> Void)? { get set }
  var onTermsButtonTap: (() -> Void)? { get set }
  
  func conformTermsAgreement(_ agree: Bool)
}
