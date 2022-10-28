protocol TabbarView: AnyObject {
  var onItemFlowSelect: ((UINavigationController) -> ())? { get set }
  var onSettingsFlowSelect: ((UINavigationController) -> ())? { get set }
  var onViewDidLoad: ((UINavigationController) -> ())? { get set }
}
