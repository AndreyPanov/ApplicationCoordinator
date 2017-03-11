protocol ItemCreateView: BaseView {
  var onHideButtonTap: (() -> Void)? { get set }
  var onCompleteCreateItem: ((ItemList) -> ())? { get set }
}
