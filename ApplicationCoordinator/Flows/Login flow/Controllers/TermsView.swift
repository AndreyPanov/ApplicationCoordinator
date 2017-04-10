protocol TermsView: BaseView {
  
  var confirmed: Bool { get set }
  var onConfirmChanged: ((Bool) -> ())? { get set }
}
