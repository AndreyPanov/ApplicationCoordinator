protocol ItemsListView: BaseView {
  var authNeed: (() -> ())? { get set }
  var onItemSelect: ((ItemList) -> ())? { get set }
  var onCreateButtonTap: (() -> ())? { get set }
}
