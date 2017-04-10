class OnboardingController: UIViewController, OnboardingView {
  
  var onFinish: (() -> Void)?
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func finishTapped(_ sender: Any) {
    onFinish?()
  }
}
