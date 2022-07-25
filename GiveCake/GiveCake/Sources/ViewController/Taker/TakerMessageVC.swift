//
//  TakerMessageVC.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/25.
//

import UIKit

class TakerMessageVC: UIViewController {
    let messageList = TakerMessageModel.instance.messageList
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var writeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myTableViewCellNib = UINib(nibName: "MyTableViewCell", bundle: nil)
        self.tableView.register(myTableViewCellNib, forCellReuseIdentifier: "MyTableViewCell")
        self.tableView.rowHeight = UITableView.automaticDimension
    
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    

    
}

extension TakerMessageVC: UITableViewDelegate, UITableViewDataSource {
    // 셀 개수 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList.count
    }
    // 각 셀에 대한 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        
        cell.emoticonLabel.text = messageList[indexPath.row].emoticon
        cell.senderLabel.text = messageList[indexPath.row].sender
        cell.contentLabel.text = messageList[indexPath.row].content

        return cell
    }
}
