protocol ItemsListView: BaseView {
  var onItemSelect: ((ItemList) -> ())? { get set }
  var onCreateItem: (() -> Void)? { get set }
}
