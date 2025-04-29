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

}
