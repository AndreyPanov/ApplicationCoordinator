protocol LoginView: BaseView {
  var onCompleteAuth: (() -> Void)? { get set }
  var onSignUpButtonTap: (() -> Void)? { get set }
}
