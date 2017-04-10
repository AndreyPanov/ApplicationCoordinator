class TermsController: UIViewController, TermsView {
  
  @IBOutlet weak var termsSwitch: UISwitch! {
    didSet { termsSwitch.isOn = confirmed }
  }
  var confirmed = false
  var onConfirmChanged: ((Bool) -> ())?
  
  @IBAction func termsSwitchValueChanged(_ sender: UISwitch) {
    onConfirmChanged?(sender.isOn)
  }
}
