//
//  AdminMessageVC.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/26.
//

import UIKit

class AdminMessageVC: UIViewController {
    fileprivate var messageList = MessageModel.instance.takerMessageList
    fileprivate let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
    fileprivate let blurView = UIVisualEffectView(effect: nil)
    fileprivate var isTableEditing = false {
        willSet{
            // 편집 모드로 들어가거나 나오기
            if isTableEditing {
                tableView.setEditing(false, animated: true)
                
                editBtn.setImage(UIImage(systemName: "trash"), for: .normal)
                editBtn.setTitle("", for: .normal)
                
                tabBarController?.tabBar.isHidden = false
            } else {
                // 빈 이미지 만들기 (nil값으로 줬을때는 왜인지 잘 작동안해서 이런 방식으로 함...)
                UIGraphicsBeginImageContext(CGSize(width: 4, height: 4))
                let emptyImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                
                tableView.setEditing(true, animated: true)
                
                editBtn.setTitle("취소", for: .normal)
                editBtn.setImage(emptyImage, for: .normal)
                
                tabBarController?.tabBar.isHidden = true
            }
        }
    }
    
    @IBOutlet var screen: UIView!
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var segmentedCtrl: UISegmentedControl!
    
    override func viewDidLoad() {
        // 테이블뷰 세팅하기
        setTableView()
        // 헤더의 그림자 세팅하기
        setHeaderShadow()
        // 버튼 동작 연결
        editBtn.addTarget(self, action: #selector(onClickedEditBtn(sender:)), for: .touchUpInside)
        segmentedCtrl.addTarget(self, action: #selector(onClickedSegmentedCtrl(sender:)), for: .valueChanged)
        // 밑에서 삭제 버튼 나오는 공간 만들기
        makeBottomDeleteView()
        // alert 세팅하기
        setAlert()
        // blurView 세팅하기
        setBlurView()
    }
    
    @objc fileprivate func onClickedEditBtn(sender: UIButton) {
        isTableEditing.toggle()
    }
    
    @objc fileprivate func onClickedDeleteBtn(sender: UIButton) {
        present(alert, animated: true)
        blurView.alpha = 0.9
    }
    
    @objc fileprivate func onClickedSegmentedCtrl(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            messageList = MessageModel.instance.takerMessageList
            tableView.reloadData()
        } else {
            messageList = MessageModel.instance.giverMessasgeList
            tableView.reloadData()
        }
    }
    
    // tableView 세팅하기
    fileprivate func setTableView() {
        let myTableCellNib = UINib(nibName: "MessageCell", bundle: nil)
        tableView.register(myTableCellNib, forCellReuseIdentifier: "MessageCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // 헤더의 그림자 세팅하기
    fileprivate func setHeaderShadow() {
        header.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        header.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        header.layer.shadowOpacity = 1.0
        header.layer.shadowRadius = 0.0
        header.layer.masksToBounds = false
    }
    
    // 밑에서 삭제 버튼 나오는 공간 만들기
    fileprivate func makeBottomDeleteView() {
        guard let tabBarHeight = tabBarController?.tabBar.frame.height else {return}
        
        let bottomDeleteView = UIView()
        bottomDeleteView.frame = CGRect(x: 0, y: kScreenH-tabBarHeight, width: kScreenW, height: tabBarHeight)
        bottomDeleteView.backgroundColor = UIColor(rgb: 0xFEFEFE)
        
        let deleteBtn = UIButton()
        deleteBtn.frame = CGRect(x: kScreenW-62, y: 17, width: 30 , height: 19)
        deleteBtn.setTitle("삭제", for: .normal)
        deleteBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        deleteBtn.setTitleColor(UIColor(rgb: 0xFC5555), for: .normal)
        deleteBtn.setTitleColor(UIColor(rgb: 0xFF8888), for: .highlighted)
        deleteBtn.addTarget(self, action: #selector(onClickedDeleteBtn(sender:)), for: .touchUpInside)
        
        bottomDeleteView.addSubview(deleteBtn)
        screen.addSubview(bottomDeleteView)
    }
    
    // alert 세팅하기
    fileprivate func setAlert() {
        alert.title = "삭제 하시겠습니까?"
        alert.message = "삭제를 하면 편지는 사라집니다.\n삭제 후에 편지를 복구할 수 없습니다."
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { _ in
            self.blurView.alpha = 0.0
        }
        let deleteAction = UIAlertAction(title: "삭제", style: .destructive) { _ in
            print(self.tableView.indexPathsForSelectedRows)
            self.isTableEditing = false
            self.blurView.alpha = 0.0
        }
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
    }
    
    // blurView 세팅하기
    fileprivate func setBlurView() {
        blurView.translatesAutoresizingMaskIntoConstraints = false
        screen.addSubview(blurView)
        blurView.edges(to: screen)
        blurView.alpha = 0.0
        blurView.effect = UIBlurEffect(style: .light)
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
        cell.tintColor = UIColor(rgb: 0x11D7D8)
        
        // 선택됐을 때 나타나는 회색 색깔 제거
        let backgroundView = UIView()
        backgroundView.backgroundColor = .white
        cell.selectedBackgroundView = backgroundView

        return cell
    }
}
