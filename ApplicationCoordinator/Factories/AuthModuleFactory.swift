protocol AuthModuleFactory {
  func makeLoginOutput() -> LoginView
  func makeSignUpHandler() -> SignUpView
  func makeTermsOutput() -> TermsView
}
