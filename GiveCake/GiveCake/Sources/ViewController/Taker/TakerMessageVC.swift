//
//  TakerMessageVC.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/25.
//

import UIKit

class TakerMessageVC: UIViewController {
    fileprivate let messageList = TakerMessageModel.instance.messageList
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var writeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 테이블뷰 세팅
        let myTableViewCellNib = UINib(nibName: "TakerMessageCell", bundle: nil)
        self.tableView.register(myTableViewCellNib, forCellReuseIdentifier: "takerMessageCell")
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.separatorStyle = .none
    
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // 헤더의 그림자 설정
        header.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        header.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        header.layer.shadowOpacity = 1.0
        header.layer.shadowRadius = 0.0
        header.layer.masksToBounds = false
        
        // 버튼 동작 연결
        writeBtn.addTarget(self, action: #selector(onClickedWriteBtn(sender:)), for: .touchUpInside)
        
        // alert 설정하기
        let alert = UIAlertController(title: "편지가 전달 됐습니다.", message: "행복한 생일 보내세요~!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        
//        guard let takerMessageWriteVC = self.storyboard?.instantiateViewController(withIdentifier: "TakerMessageWriteVC") as? TakerMessageWriteVC else {return}
//        
//        
//        takerMessageWriteVC.completionHandler = {
//            self.present(alert, animated: true)
//        }
    }
    
    // 메시지 작성 화면으로 이동
    @objc fileprivate func onClickedWriteBtn(sender: UIButton) {
        performSegue(withIdentifier: "goToTakerMessageWrite", sender: nil)
    }

    
}

extension TakerMessageVC: UITableViewDelegate, UITableViewDataSource {
    // 셀 개수 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList.count
    }
    // 각 셀에 대한 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "takerMessageCell", for: indexPath) as! TakerMessageCell
        
        cell.emoticonLabel.text = messageList[indexPath.row].emoticon
        cell.senderLabel.text = messageList[indexPath.row].sender
        cell.contentLabel.text = messageList[indexPath.row].content

        return cell
    }
}
