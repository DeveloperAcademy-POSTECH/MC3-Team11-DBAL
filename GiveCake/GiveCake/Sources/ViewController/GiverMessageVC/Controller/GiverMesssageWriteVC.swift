//
//  GiverMesssageWriteVC.swift
//  GiveCake
//
//  Created by KimJS on 2022/07/17.
//

import UIKit

class GiverMesssageWriteVC: UIViewController {

    @IBOutlet var lbNumberOfCake: UILabel!
    @IBOutlet var tfWriteMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSendMessage(_ sender: UIButton) {
    }
    
    @IBAction func stpNumberOfCake(_ sender: UIStepper) {
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
