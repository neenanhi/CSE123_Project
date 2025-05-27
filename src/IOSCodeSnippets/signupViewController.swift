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
        guard let email = emailTxtField.text,!email.isEmpty,
        let password = pwdTxtField.text, !password.isEmpty else {
        let alert = UIAlertController(title: "err", message: "All fields must be filled out", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "", style: .default, handler: nil))
        present(alert, animated: true)
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (authResult, error) in
            if let error = error {
            let alert = UIAlertController(title: "err", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "", style: .default, handler: nil))
                self?.present(alert, animated: true)
                return
        }
                    
        guard let user = authResult?.user else { return }
                
        let db = Firestore.firestore()
            db.collection("users").document(user.uid).setData(["email": email,"uid": user.uid]){
                [weak self] (error) in
                if let error =error {
                    let alert = UIAlertController(title: "err", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "", style: .default, handler: nil))
                    self?.present(alert, animated: true)
                    return
                }
            }
            self?.performSegue(withIdentifier: "signUpToHome", sender: self)
        }
        
    }
    
    
    
    
    @IBAction func signupButtonToLogin(_ sender: Any) {
        self.performSegue(withIdentifier: "signUpToLogin", sender: self)
        
    }
    
    
}

