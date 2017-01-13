protocol ItemCreateView: BaseView {
  var onHideButtonTap: (() -> ())? { get set }
  var onCompleteCreateItem: ((ItemList) -> ())? { get set }
}
