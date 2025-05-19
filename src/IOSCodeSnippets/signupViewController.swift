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

}