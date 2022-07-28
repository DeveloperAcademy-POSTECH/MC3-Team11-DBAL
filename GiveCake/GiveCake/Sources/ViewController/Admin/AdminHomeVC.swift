//
//  AdminHomeVC.swift
//  GiveCake
//
//  Created by YOON CHANG HYO on 2022/07/27.
//

import UIKit

class CloudKit {
    func getCakeNumber() -> Int{
        return 120
    }
}

class AdminHomeVC : UIViewController{
    
    @IBOutlet weak var countKidsView: UIView!
    @IBOutlet weak var countCakeView: UIView!
    @IBOutlet weak var gageView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let trackLayer = CAShapeLayer()
        let shapeLayer = CAShapeLayer()
        let center = CGPoint(x: gageView.frame.width/2, y: gageView.frame.height/2)
        print(center)
        let circularPath = UIBezierPath(arcCenter: center, radius: 120, startAngle: -CGFloat.pi / 2, endAngle: 1.5 * CGFloat.pi, clockwise: true)
        
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 0.9999999404, alpha: 1)
        trackLayer.lineWidth = 30
        trackLayer.fillColor = UIColor.clear.cgColor
        
        gageView.layer.addSublayer(trackLayer)
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = #colorLiteral(red: 0.9607843137, green: 0.6901960784, blue: 0.7411764706, alpha: 1)
        shapeLayer.lineWidth = 30
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round
        
        gageView.layer.addSublayer(shapeLayer)
        
        let cloudKit = CLoudkit()
        let cakeNum = cloudKit.getCakeNumber()
        
        makeAnimation(shapeLayer: shapeLayer, value: Double(cakeNum)/150.0)
        
        gageView.backgroundColor = .clear

        countKidsView.layer.cornerRadius = 20
        countCakeView.layer.cornerRadius = 25
        
    }
    func makeAnimation(shapeLayer: CAShapeLayer, value: Double) {
        let basicAnimation = CABasicAnimation(keyPath: "storkeEnd")
        
        basicAnimation.fromValue = 0
        basicAnimation.toValue = value
        basicAnimation.duration = 2
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
        
    }

}


