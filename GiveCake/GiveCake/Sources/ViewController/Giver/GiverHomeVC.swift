//
//  GiverHomeVC.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/14.
//

import UIKit
import AVKit

class GiverHomeVC: UIViewController {

    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var countCakeView: UIView!
    @IBOutlet weak var countKidsView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var gageView: UIView!
    @IBOutlet weak var celebrateGirlImage: UIImageView!
    @IBOutlet weak var totalNum: UILabel!
    
    var playerLooper: NSObject?
    var queuePlayer: AVQueuePlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        putAnimation()
        
        let trackLayer = CAShapeLayer()
        let shapeLayer = CAShapeLayer()
        let center = CGPoint(x: gageView.frame.width/2 , y: gageView.frame.height/2)
        print(center)
        let circularPath = UIBezierPath(arcCenter: center, radius: 120, startAngle: -CGFloat.pi / 2, endAngle: 1.5 * CGFloat.pi, clockwise: true)
        
        // 게이지 트랙 라인입니다.
        trackLayer.path = circularPath.cgPath
        
        trackLayer.strokeColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 0.9999999404, alpha: 1)
        //trackLayer.strokeColor = UIColor(rgb: 0xE5E5EA).cgColor
        trackLayer.lineWidth = 30
        trackLayer.fillColor = UIColor.clear.cgColor
        //trackLayer.lineCap = .round, 게이지엔 둥근 캡이 필요없음
        gageView.layer.addSublayer(trackLayer)
        
        // 게이지 표시 라인입니다.
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = #colorLiteral(red: 0.9607843137, green: 0.6901960784, blue: 0.7411764706, alpha: 1)
        shapeLayer.lineWidth = 30
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round
        
        gageView.layer.addSublayer(shapeLayer)
        
        let cloudkit = CLoudkit()
        let cakeNum = cloudkit.getCakeNumber()
        //150보다 크거나 같을때 countCakeView를 숨긴다 (num에 cakeNum이 들어온다.)
        didCompleteCountCake(num: cakeNum)
        //총 개수를 보여주는 라벨의 수를 바꿔줌
        totalNum.text = String(cakeNum) + "/150"
        
        makeAnimation(shapeLayer: shapeLayer, value: Double(cakeNum)/150.0)
        //게이지뷰 투명화
        gageView.backgroundColor = .clear
       
        // 월별 생일 아동 수치 보드, 원형게이지 보드 반지름 값
        countKidsView.layer.cornerRadius = 20
        countCakeView.layer.cornerRadius = 25
        animationView.layer.cornerRadius = 20
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        queuePlayer?.pause()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        queuePlayer?.play()
    }
    
    // 게이지 애니메이션 설정
    func makeAnimation(shapeLayer: CAShapeLayer, value: Double) {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.fromValue = 0
        basicAnimation.toValue = value
        
        basicAnimation.duration = 2
        
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
        
        
    }
    
    // 케익 모두 채워졌을 때 애니메이션 보여주기
    func putAnimation() {
        guard let path = Bundle.main.path(forResource: "cake_complete_animation", ofType: "mp4") else {return}
        let fileURL = URL(fileURLWithPath: path)
        let item = AVPlayerItem(url: fileURL)
        queuePlayer = AVQueuePlayer(playerItem: item)
        guard let queuePlayer = queuePlayer else {
            return
        }
        queuePlayer.replaceCurrentItem(with: item)
        playerLooper = AVPlayerLooper(player: queuePlayer, templateItem: item)
        let playerLayer = AVPlayerLayer(player: queuePlayer)
        playerLayer.frame = animationView.bounds
        playerLayer.videoGravity = .resizeAspectFill
        animationView.layer.addSublayer(playerLayer)
        queuePlayer.play()
    }
    
    func didCompleteCountCake (num: Int) {
        if num >= 150 {
            countCakeView.isHidden = true
            animationView.isHidden = false
            countKidsView.topAnchor.constraint(equalTo: animationView.bottomAnchor, constant: 25).isActive = true
        } else {
            countCakeView.isHidden = false
            animationView.isHidden = true
        }
        
    }
}
