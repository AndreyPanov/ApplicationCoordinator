protocol LoginView: BaseView {
  var onCompleteAuth: (() -> ())? { get set }
  var onSignUpButtonTap: (() -> ())? { get set }
}
