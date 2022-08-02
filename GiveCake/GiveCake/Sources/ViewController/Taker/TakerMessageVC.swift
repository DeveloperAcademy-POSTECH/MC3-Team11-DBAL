//
//  TakerMessageVC.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/25.
//

import UIKit

class TakerMessageVC: UIViewController {
//    fileprivate let messageList = MessageModel.instance.takerMessageList
    fileprivate var messageList: [WrittenByGiver] = []
    fileprivate let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
    fileprivate let blurView = UIVisualEffectView(effect: nil)
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var writeBtn: UIButton!
    @IBOutlet var screen: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirebaseManager.instance.loadData(collectionName: "WrittenByGiver") { isSuccess, conveyedArray in
            if isSuccess {
                self.messageList = conveyedArray as? [WrittenByGiver] ?? []
                // 테이블뷰 세팅하기
                self.setTableView()
                // 헤더의 그림자 세팅하기
                self.setHeaderShadow()
                // 버튼 동작 연결
                self.writeBtn.addTarget(self, action: #selector(self.onClickedWriteBtn(sender:)), for: .touchUpInside)
                // alert 세팅하기
            } else {
                print("통신에 어떤 식으로든 문제가 발생했다...")
            }
        }
        self.setAlert()
        // blurView 세팅하기 (blur가 이상해서 일단은 제거)
        // setBlurView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? TakerMessageWriteVC else {return}
        // 메세지 작성 뷰에서 모달이 내려가면 실행할 코드
        vc.completionHandler = {
            // 0.5초 있다가 alert 띄워주고 blur 효과주기
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                // self.blurView.alpha = 0.9
                self.present(self.alert, animated: true)
            }
        }
    }
    
    // 메시지 작성 화면으로 이동
    @objc fileprivate func onClickedWriteBtn(sender: UIButton) {
        performSegue(withIdentifier: "goToTakerMessageWrite", sender: nil)
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
    
    // alert 세팅하기
    fileprivate func setAlert() {
        alert.title = "편지가 전달 됐습니다."
        alert.message = "행복한 생일 보내세요~!"
        // 확인 누르면 blur효과 지우기
        let okAction = UIAlertAction(title: "확인", style: .default) { _ in
//            UIView.animate(withDuration: 0.1, delay: 0, animations: {
//                self.blurView.alpha = 0.0
//            })
        }
        alert.addAction(okAction)
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

extension TakerMessageVC: UITableViewDelegate, UITableViewDataSource {
    // 셀 개수 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList.count
    }
    // 각 셀에 대한 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageCell
        
//        cell.emoticonLabel.text = messageList[indexPath.row].emoticon
//        cell.senderLabel.text = messageList[indexPath.row].sender
//        cell.contentLabel.text = messageList[indexPath.row].content

        cell.emoticonLabel.text = MessageModel.emoticons[indexPath.row]
        cell.senderLabel.text = messageList[indexPath.row].giverNaverID
        cell.contentLabel.text = messageList[indexPath.row].messageFromGiverToTaker
        return cell
    }
}
