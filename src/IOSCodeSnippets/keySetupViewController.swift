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

}