import UIKit
import FirebaseFirestore
import FirebaseAuth

class keySetupViewController: UIViewController {
    
    @IBOutlet weak var keyEntered: UITextField!
    @IBOutlet weak var setKeyButton: UIButton!
    
    let db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func setKeyUser(_ sender: Any) {
        guard let user = Auth.auth().currentUser else {
            return
        }
        guard let accessKey = keyEntered.text, !accessKey.isEmpty else {
            return
        }
        
        let userRef = db.collection("users").document(user.uid)
    
        
        userRef.setData(["accessKey": accessKey], merge: true) { error in
            if let error = error {
                //
            } else {
                UserDefaults.standard.set(true, forKey: "didSetAccessKey")
                UserDefaults.standard.synchronize()
                self.dismiss(animated:true, completion: nil)
            }
        }
    }
}
