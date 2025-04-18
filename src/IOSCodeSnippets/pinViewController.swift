import UIKit
import FirebaseFirestore

class pinViewController: UIViewController, UITableViewDataSource {
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
    

    
    @IBOutlet weak var pinTableView: UITableView!
    
   // var testData = ["1981845", "8481713"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pinTableView.dataSource = self
   
        pinTableView.rowHeight = 100
        
        pinTableView.reloadData()
        
        
    }


}
