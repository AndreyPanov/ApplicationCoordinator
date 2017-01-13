protocol SignUpView: BaseView {
  
  var confirmed: Bool { get set }
  var onSignUpComplete: (() -> ())? { get set }
  var onTermsButtonTap: (() -> ())? { get set }
  
  func conformTermsAgreement(_ agree: Bool)
}
