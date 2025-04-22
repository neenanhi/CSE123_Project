import UIKit
import FirebaseFirestore
import FirebaseAuth


class pinViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
// find pin to delete
            let pinToDelete = testData[indexPath.row]

            let userRef = db.collection("users").document(user.uid)
            userRef.updateData([
                "userPins": FieldValue.arrayRemove([pinToDelete])
            ]) { error in
                if let error = error {
                    print("\(error.localizedDescription)")
                } else {
                    print("deleted PIN" success")
                    
                    self.testData.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
   
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
                   print("Added ne PIN")
               }
           }
        
    }
    func loadUserPins() {
        guard let user = Auth.auth().currentUser else {
            print("Auth user not found")
            return
        }

        let userRef = db.collection("users").document(user.uid)
        
        userRef.getDocument { (document, error) in
            if let error = error {
                print("\(error.localizedDescription)")
                return
            }
            
            if let document = document, document.exists {
                if let pins = document.data()?["userPins"] as?[String] {
                    self.testData = pins
                    self.pinTableView.reloadData()
                } else {
                    print("array not present")
                }
            } else {
                print("NA")
            }
        }
    }
    
    @IBOutlet weak var pinTableView: UITableView!
    
    // placeholder below
    var testData = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pinTableView.delegate = self
        
        
        pinTableView.dataSource = self
        
        pinTableView.backgroundColor = .white
        pinTableView.rowHeight = 100
        loadUserPins()
        
        pinTableView.reloadData()
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadUserPins()
    }


}
