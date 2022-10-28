protocol ItemCreateCoordinatorOutput: AnyObject {
  var finishFlow: ((ItemList?)->())? { get set }
}
