import UIKit
import FirebaseFirestore
import FirebaseAuth

class signupViewController: UIViewController {
@IBOutlet weak var emailTxtField: UITextField!
    
    
    @IBOutlet weak var pwdTxtField: UITextField!
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    
    @IBOutlet weak var goToLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

@IBAction func signUpClicked(_ sender: Any) {
        guard let email = emailTxtField.text, !email.isEmpty,
        let password = pwdTxtField.text,!password.isEmpty else {
        let alert = UIAlertController(title: "err", message: "All fields must be filled out", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "", style: .default, handler: nil))
        present(alert, animated: true)
            return
        }

}