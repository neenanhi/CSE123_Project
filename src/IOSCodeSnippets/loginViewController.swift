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
            
            let alert = UIAlertController(title: "fix", message: "fill out properly", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "good", style: .default, handler: nil))
            present(alert, animated: true)
            return
            
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (authResult, error) in
            if let error = error {
            
                let alert = UIAlertController(title: "err", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "good", style: .default, handler: nil))
                self?.present(alert, animated: true)
                return
            }
            self?.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        
        self.performSegue(withIdentifier: "loginToSignUp", sender: self)
    }
    
}
