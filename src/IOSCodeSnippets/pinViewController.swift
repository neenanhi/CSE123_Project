import UIKit
import FirebaseAuth
import FirebaseFirestore

class pinViewController: UIViewController, UITableViewDataSource {
	
	let db = Firestore.firestore()
	
	@IBOutlet weak var newPinButton: UIButton!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pinCell", for: indexPath)
                
                cell.textLabel?.text = testData[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.textLabel?.backgroundColor = .systemBlue
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 40)
        
        cell.textLabel?.textAlignment = .center
        
        return cell
    }

	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let user = Auth.auth().currentUser else { return }

            let pinToDelete = testData[indexPath.row]

            let userRef = db.collection("users").document(user.uid)
            userRef.updateData([
                "userPins": FieldValue.arrayRemove([pinToDelete])
            ]) { error in
                if let error = error {
                    print("Error deleting pin from Firestore: \(error.localizedDescription)")
                } else {
                    print("Pin deleted from Firestore.")
                    
                    self.testData.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
    

    
    @IBOutlet weak var pinTableView: UITableView!

@IBAction func generatePin(_ sender: Any) {
guard let user = Auth.auth().currentUser else {
            return
        }
        
        let allowedCharacters = ["0", "1", "2", "3", "7", "8", "9", "A", "C", "D"]
        var newPin = ""
}
    
   // var testData = ["1981845", "8481713"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pinTableView.dataSource = self
   
        pinTableView.rowHeight = 100
        
        pinTableView.reloadData()
        
        
    }


}
