import UIKit
import FirebaseFirestore
import FirebaseAuth

class tempPinViewController: UIViewController, UITableViewDataSource {

	let db = Firestore.firestore()
    	var listener: ListenerRegistration?
   
    	@IBOutlet weak var newPinButton2: UIButton!
    
    	@IBOutlet weak var pinTableView2: UITableView!
    
    	var accessKeyOverlay: UIView?
    
    
   	 var testData2 = [""]

}