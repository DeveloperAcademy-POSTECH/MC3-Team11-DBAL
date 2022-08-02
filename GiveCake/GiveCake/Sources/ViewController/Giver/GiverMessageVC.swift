//
//  GiverMessageVC.swift
//  GiveCake
//
//  Created by 이성수 on 2022/07/28.
//

import UIKit

class GiverMessageVC: UIViewController {
    //    fileprivate let messageList = MessageModel.instance.giverMessageList
    fileprivate var messageList: [WrittenByTaker] = []
    let alert = UIAlertController(title: "마음이 전달 됐습니다.", message: "아이들이 행복한 세상! \n 늘 함께해주셔서 감사합니다~!", preferredStyle: .alert)
    
    @IBOutlet weak var writeBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var header: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirebaseManager.instance.loadData(collectionName: "WrittenByTaker") { isSuccess, conveyedArray in
            if isSuccess {
                self.messageList = conveyedArray as? [WrittenByTaker] ?? []
                
                let okAction = UIAlertAction(title: "확인", style: .default)
                
                self.alert.addAction(okAction)
                
                let myTableCellNib = UINib(nibName: "MessageCell", bundle: nil)
                self.tableView.register(myTableCellNib, forCellReuseIdentifier: "MessageCell")
                self.tableView.rowHeight = UITableView.automaticDimension
                self.tableView.separatorStyle = .none
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.setHeaderShadow()
            } else {
                print("통신에 어떤 식으로든 문제가 발생했다...")
            }
        }
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
        //        cell.emoticonLabel.text = messageList[indexPath.row].emoticon
        //        cell.emoticonLabel.text = MessageModel.emoticons[indexPath.row]
        cell.emoticonLabel.text = MessageModel.emoticons.randomElement()
        cell.senderLabel.text = messageList[indexPath.row].takerName
        cell.contentLabel.text = messageList[indexPath.row].messageFromTakerToGiver
        
        return cell
    }
}
