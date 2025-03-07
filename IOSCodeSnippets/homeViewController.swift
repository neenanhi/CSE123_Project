//
//  ------------.swift
//  SmartLock123
//
//  Created by J T on 3/3/25.
//

import UIKit
import FirebaseFirestore

class homeViewController: UIViewController {
    
    let db = Firestore.firestore()

    var lockStatus: Int = 0
    
    @IBOutlet weak var lockButton: UIButton!

    @IBOutlet weak var unlockButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func lockClicked(_ sender: Any) {
        lockStatus = 0
        print(lockStatus)
     //   changeLock()
    }
    
    @IBAction func unlockClicked(_ sender: Any) {
        lockStatus = 1
        print(lockStatus)
//        changeLock()
    }
    
    func changeLock() {
        /*
       Database info is here - hiding code for upload
        */
    }
   
}
