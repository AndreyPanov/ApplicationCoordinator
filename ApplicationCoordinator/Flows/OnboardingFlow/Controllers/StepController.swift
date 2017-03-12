class StepController: UIViewController {
  
  @IBOutlet weak var titleLabel: UILabel!
  var titleText: String? {
    get { return titleLabel.text }
    set { titleLabel.text = newValue }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func skipTapped(_ sender: Any) {
  }
  
  @IBAction func nextTapped(_ sender: Any) {
  }
}
