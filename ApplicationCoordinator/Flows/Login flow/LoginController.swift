final class LoginController: UIViewController, LoginView {
  
  //controller handler
  var onCompleteAuth: (() -> ())?
  var onSignUpButtonTap: (() -> ())?
  
  @IBAction func loginButtonClicked(_ sender: AnyObject) { onCompleteAuth?() }
  @IBAction func signUpClicked(_ sender: AnyObject) { onSignUpButtonTap?() }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Login"
  }
}
