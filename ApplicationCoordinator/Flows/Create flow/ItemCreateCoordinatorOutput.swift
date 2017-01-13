protocol ItemCreateCoordinatorOutput: class {
  var finishFlow: ((ItemList?)->())? { get set }
}
