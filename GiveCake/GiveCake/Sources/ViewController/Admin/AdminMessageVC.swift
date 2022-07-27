//
//  AdminMessageVC.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/26.
//

import UIKit

class AdminMessageVC: UIViewController {
    fileprivate let messageList = TakerMessageModel.instance.messageList
    
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var segmentedCtrl: UISegmentedControl!
    
    override func viewDidLoad() {
        
        
        // 테이블뷰 세팅
        let myTableCellNib = UINib(nibName: "MessageCell", bundle: nil)
        tableView.register(myTableCellNib, forCellReuseIdentifier: "MessageCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // 헤더의 그림자 설정
        header.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        header.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        header.layer.shadowOpacity = 1.0
        header.layer.shadowRadius = 0.0
        header.layer.masksToBounds = false
        
        // 버튼 동작 연결
        deleteBtn.addTarget(self, action: #selector(onClickedDeleteBtn(sender:)), for: .touchUpInside)
    }
    
    @objc fileprivate func onClickedDeleteBtn(sender: UIButton) {
        // 편집 모드로 들어가거나 나오기 + 버튼 라벨 바꾸기
        if tableView.isEditing {
            tableView.setEditing(false, animated: true)
            deleteBtn.setImage(UIImage(systemName: "trash"), for: .normal)
            deleteBtn.setTitle("", for: .normal)
        } else {
            // 빈 이미지 만들기 (nil값으로 줬을때는 왜인지 잘 작동안해서 이런 방식으로 함...)
            UIGraphicsBeginImageContext(CGSize(width: 4, height: 4))
            let emptyImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            tableView.setEditing(true, animated: true)
            deleteBtn.setTitle("취소", for: .normal)
            deleteBtn.setImage(emptyImage, for: .normal)
        }
    }
}

extension AdminMessageVC: UITableViewDelegate, UITableViewDataSource {
    // 셀 개수 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList.count
    }
    // 각 셀에 대한 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageCell
        
        cell.emoticonLabel.text = messageList[indexPath.row].emoticon
        cell.senderLabel.text = messageList[indexPath.row].sender
        cell.contentLabel.text = messageList[indexPath.row].content
        
        // 선택됐을 때 나타나는 회색 색깔 제거
        let backgroundView = UIView()
        backgroundView.backgroundColor = .white
        cell.selectedBackgroundView = backgroundView

        return cell
    }
}
