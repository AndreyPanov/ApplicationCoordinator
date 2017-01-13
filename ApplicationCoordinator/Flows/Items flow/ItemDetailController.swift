final class ItemDetailController: UIViewController, ItemDetailView {
  
  //controller handler
  var itemList: ItemList?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = itemList?.title ?? "Detail"
  }
}
