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


	}
}