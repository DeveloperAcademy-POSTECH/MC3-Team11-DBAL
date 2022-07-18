//
//  GiverMessageReceiveVC.swift
//  GiveCake
//
//  Created by KimJS on 2022/07/17.
//

import UIKit

class GiverMessageReceiveVC: UIViewController {
    
    var receivedName: String = ""
    var receivedBody: String = ""
    
    @IBOutlet var lbreceivedName: UILabel!
    @IBOutlet var lbreceivedBody: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lbreceivedName.text = receivedName
        lbreceivedBody.text = receivedBody
    }
    
    func receiveData(name: String, body: String) {
        receivedName = "받는사람: " + "그라운드17"
        receivedBody = body
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
