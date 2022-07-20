//
//  GiverHomeVC.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/14.
//

import UIKit

class CLoudkit {
    func getCakeNumber() -> Int{
        
        return 120
        
    }
    
}

class GiverHomeVC: UIViewController {

    @IBOutlet weak var cakeNum: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var gageView: UIView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let trackLayer = CAShapeLayer()
        let shapeLayer = CAShapeLayer()
        let center = CGPoint(x: gageView.frame.width/2 , y: gageView.frame.height/2)
        print(center)
        let circularPath = UIBezierPath(arcCenter: center, radius: 120, startAngle: -CGFloat.pi / 2, endAngle: 1.5 * CGFloat.pi, clockwise: true)
        // 게이지 트랙 라인입니다.
        trackLayer.path = circularPath.cgPath
        
        trackLayer.strokeColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.9568627451, alpha: 1)
        //trackLayer.strokeColor = UIColor(rgb: 0xE5E5EA).cgColor
        trackLayer.lineWidth = 30
        trackLayer.fillColor = UIColor.clear.cgColor
        //trackLayer.lineCap = .round, 게이지엔 둥근 캡이 필요없음
        gageView.layer.addSublayer(trackLayer)
        
        
        
        // 게이지 표시 라인입니다.
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.systemBlue.cgColor
        shapeLayer.lineWidth = 30
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round
        
        gageView.layer.addSublayer(shapeLayer)
        
        let cloudkit = CLoudkit()
        let cakeNum = cloudkit.getCakeNumber()
        
        makeAnimation(shapeLayer: shapeLayer, value: Double(cakeNum)/150.0)
    
        
      
        
    }
    
    func makeAnimation(shapeLayer: CAShapeLayer, value: Double) {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.fromValue = 0
        basicAnimation.toValue = value
        
        basicAnimation.duration = 2
        
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
        
        
    }
}
