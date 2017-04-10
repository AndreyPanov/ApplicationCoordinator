protocol ItemModuleFactory {
  func makeItemsOutput() -> ItemsListView
  func makeItemDetailOutput(item: ItemList) -> ItemDetailView
}
