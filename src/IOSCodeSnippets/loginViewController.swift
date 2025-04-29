import UIKit
import FirebaseFirestore
import FirebaseAuth

class loginViewController: UIViewController {

  @IBOutlet weak var emailLog: UITextField!
    @IBOutlet weak var passLog: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var goToSignUpButton: UIButton!

	override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
           
            if Auth.auth().currentUser != nil {
    
                self.performSegue(withIdentifier: "loginToHome", sender: self)
            }
        }

	@IBAction func loginButtonClicked(_ sender: Any) {
        
        guard let email = emailLog.text, !email.isEmpty,
              let password = passLog.text, !password.isEmpty else {
            
            let alert = UIAlertController(title: "", message: "fill all fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "", style: .default, handler: nil))
            present(alert, animated: true)
            return
            
        }

}
