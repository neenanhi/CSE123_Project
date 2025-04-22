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
                    print("error in deletion\(error.localizedDescription)")
                } else {
                    print("deleted pin")
                    
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
	for _ in 0..<4 {
            if let randomChar = allowedCharacters.randomElement() {
                newPin.append(randomChar)
            }
        }

	  testData.append(newPin)
        pinTableView.reloadData()
        
        let userRef = db.collection("users").document(user.uid)

	 userRef.updateData([
               "userPins": FieldValue.arrayUnion([newPin])
           ]) { error in
               if let error = error {
                   print("\(error.localizedDescription)")
               } else {
                   print("New PIN added")
               }
           }
}
	func loadUserPins() {
guard let user = Auth.auth().currentUser else {
            print("can't find user auth")
            return
        }

	let userRef = db.collection("users").document(user.uid)
userRef.getDocument { (document, error) in
            if let error = error {
                print("could not fetch user pins \(error.localizedDescription)")
                return
            }
if let document = document, document.exists {
                if let pins = document.data()?["userPins"] as? [String] {
                    self.testData = pins
		self.pinTableView.reloadData()
                } else {
                    print("userPins not found")
                }
}
    
   // var testData = ["1981845", "8481713"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pinTableView.dataSource = self
   
        pinTableView.rowHeight = 100
        
        pinTableView.reloadData()
        
        
    }


}
