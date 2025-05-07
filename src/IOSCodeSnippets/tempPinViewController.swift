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

	 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        	return testData2.count
    	}

	 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "pinCell2", for: indexPath)
        cell.textLabel?.text = testData2[indexPath.row]
        cell.textLabel?.textColor = .white
      
        cell.textLabel?.backgroundColor = UIColor(red: 151/255, green: 49/255, blue: 39/255, alpha: 1)
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 40)
        
        cell.textLabel?.textAlignment = .center
        
        return cell
    }

}