//
//  TodayAnimationTransition.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/16.
//

import UIKit

fileprivate let transitonDuration: TimeInterval = 1.0


enum AnimationType {
    case present
    case dismiss
}

class FeedAnimationTransition: NSObject {
    let animationType: AnimationType!
    
    init(animationType: AnimationType) {
        self.animationType = animationType
        super.init()
    }
}

// 뷰 전환 커스텀 애니메이션
extension FeedAnimationTransition: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitonDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if animationType == .present {
            animationForPresent(using: transitionContext)
        } else {
            animationForDismiss(using: transitionContext)
        }
    }
    
    // 상세보기 화면으로 넘어갈때
    func animationForPresent(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        // 1. 어떤 뷰(from)에서 어떤 뷰(to)로 넘어갈지 정하기
        guard let fromVC = transitionContext.viewController(forKey: .from) as? GiverTabBarVC else { return }
        guard let tableViewController = fromVC.viewControllers?[1] as? FeedViewController else { return }
        guard let toVC = transitionContext.viewController(forKey: .to) as? FeedDetailViewController else { return }
        guard let selectedCell = tableViewController.selectedCell else { return }
        
        let frame = selectedCell.convert(selectedCell.bgBackView.frame, to: fromVC.view)
        // 2. 일단은 to 뷰의 이미지를 from 뷰에 있던 테이블 셀에서의 이미지 사이즈로 설정함
        toVC.view.frame = frame
        toVC.scrollView.imageView.frame.size.width = GlobalConstants.feedCardSize.width
        toVC.scrollView.imageView.frame.size.height = GlobalConstants.feedCardSize.height
        toVC.scrollView.descriptionView.frame = CGRect(
            x: 0,
            y: GlobalConstants.feedCardSize.height - GlobalConstants.feedCardTitleHeight,
            width: GlobalConstants.feedCardSize.width,
            height: GlobalConstants.feedCardTitleHeight
        )
        toVC.scrollView.dayView.alpha = 0
        
        containerView.addSubview(toVC.view)
        // 3. to 뷰의 이미지 사이즈를 애니메이션과 함께 화면 가로에 맞게 늘려줌
        UIView.animate(withDuration: transitonDuration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            toVC.view.frame = UIScreen.main.bounds
            toVC.scrollView.imageView.frame.size.width = kScreenW
            toVC.scrollView.imageView.frame.size.height = GlobalConstants.feedCardDetailImageHeight
            toVC.scrollView.descriptionView.frame = CGRect(
                x: 0,
                y: GlobalConstants.feedCardDetailImageHeight - GlobalConstants.feedCardTitleHeight,
                width: kScreenW,
                height: GlobalConstants.feedCardTitleHeight
            )

            toVC.closeBtn.alpha = 1
            toVC.scrollView.dayView.alpha = 1
            
            fromVC.tabBar.frame.origin.y = kScreenH
        }) { (completed) in
            transitionContext.completeTransition(completed)
        }
    }
    
    // 상세보기 화면에서 뒤로갈때
    func animationForDismiss(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from) as? FeedDetailViewController else { return }
        guard let toVC = transitionContext.viewController(forKey: .to) as? GiverTabBarVC else { return }
        guard let tableViewController = toVC.viewControllers?[1] as? FeedViewController else { return }
        guard let selectedCell = tableViewController.selectedCell else { return }
        
        // from 뷰의 이미지 사이즈를 애니메이션과 함께 원래 테이블 셀의 크기에 맞게 줄여줌
        UIView.animate(withDuration: transitonDuration - 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
            let frame = selectedCell.convert(selectedCell.bgBackView.frame, to: toVC.view)
            fromVC.view.frame = frame
            fromVC.view.layer.cornerRadius = GlobalConstants.feedCardCornerRadius
            fromVC.scrollView.imageView.frame.size.width = GlobalConstants.feedCardSize.width
            fromVC.scrollView.imageView.frame.size.height = GlobalConstants.feedCardSize.height
            fromVC.scrollView.descriptionView.frame = CGRect(
                x: 0,
                y: GlobalConstants.feedCardSize.height - GlobalConstants.feedCardTitleHeight,
                width: GlobalConstants.feedCardSize.width,
                height: GlobalConstants.feedCardTitleHeight
            )
            fromVC.closeBtn.alpha = 0
            fromVC.scrollView.dayView.alpha = 0
            
            toVC.tabBar.frame.origin.y = kScreenH - toVC.tabBar.frame.height
        }) { (completed) in
            transitionContext.completeTransition(completed)
            toVC.view.addSubview(toVC.tabBar)
        }
    }
    
}

