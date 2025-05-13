import FirebaseFirestore
import FirebaseAuth
import UIKit

class logoutViewController: UIViewController {
    
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    
    @IBOutlet weak var logoutButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchUsername()
        
    }
    
    func fetchUsername() {
            guard let user = Auth.auth().currentUser else {
                usernameLabel.text = "No current user"
                return
            }

            let userDocRef = db.collection("users").document(user.uid)
            userDocRef.getDocument { (document, error) in
                if let error = error {
                    print("\(error.localizedDescription)")
                    self.usernameLabel.text = "Can't load username"
                    return
                }

                if let document = document, document.exists {
                    let data = document.data()
                    let username = data?["email"] as? String ?? "User not known"
                    self.usernameLabel.text = "\(username)"
                } else {
                    self.usernameLabel.text = "Cannot find user"
                }
            }
        }
    
    
    @IBAction func userLoggedOut(_ sender: Any) {
        
        do {
                try Auth.auth().signOut()
                
                self.performSegue(withIdentifier: "logoutToLogin", sender: self)
            } catch let signOutError as NSError {
                print("Signout error: %@", signOutError)
                let alert = UIAlertController(title: "Failed to log out", message: signOutError.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
    }
    
    
}

