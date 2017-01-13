final class ItemsListController: UIViewController, ItemsListView {
  
  //controller handler
  var authNeed: (() -> ())?
  var onItemSelect: ((ItemList) -> ())?
  var onCreateButtonTap: (() -> ())?
  
  @IBAction func addItemButtonClicked(_ sender: UIBarButtonItem) { onCreateButtonTap?() }
  
  @IBOutlet weak var tableView: UITableView!
  //mock datasource
  var items = (0...10).map { index in return ItemList(title: "Item № \(index)", subtitle: "Item descripton") }
  var authCheck = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Items"
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      barButtonSystemItem: .add,
      target: self,
      action: #selector(ItemsListController.addItemButtonClicked(_:))
    )
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    if !authCheck {
      authNeed?()
      authCheck = true
    }
  }
}

extension ItemsListController: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let item = items[(indexPath as NSIndexPath).row]
    cell.textLabel?.text = item.title
    cell.detailTextLabel?.text = item.subtitle
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    onItemSelect?(items[(indexPath as NSIndexPath).row])
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
