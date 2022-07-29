//
//  GiverMessageVC.swift
//  GiveCake
//
//  Created by 이성수 on 2022/07/28.
//

import UIKit

class GiverMessageVC: UIViewController {
    fileprivate let messageList = MessageModel.instance.giverMessageList
    let alert = UIAlertController(title: "마음이 전달 됐습니다.", message: "아이들이 행복한 세상! \n 늘 함께해주셔서 감사합니다~!", preferredStyle: .alert)
    
    @IBOutlet weak var writeBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var header: UIView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let okAction = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(okAction)
        
        let myTableCellNib = UINib(nibName: "MessageCell", bundle: nil)
        tableView.register(myTableCellNib, forCellReuseIdentifier: "MessageCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        setHeaderShadow()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? GiverMessageWriteVC else {return}
        vc.complitionHandler = {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.present(self.alert, animated: true)
            }
        }
    }
    
    fileprivate func setHeaderShadow(){
        header.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        header.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        header.layer.shadowOpacity = 1.0
        header.layer.shadowRadius = 2.0
        header.layer.masksToBounds = false
    }


}


extension GiverMessageVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageCell
        cell.emoticonLabel.text = messageList[indexPath.row].emoticon
        cell.senderLabel.text = messageList[indexPath.row].sender
        cell.contentLabel.text = messageList[indexPath.row].content
        
        return cell
    }
}
