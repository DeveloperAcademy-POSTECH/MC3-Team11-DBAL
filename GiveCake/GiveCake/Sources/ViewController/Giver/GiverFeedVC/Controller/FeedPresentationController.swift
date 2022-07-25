//
//  CardPresentationController.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/16.
//

import UIKit

// 커스텀 애니메이션을 위해 기존 뷰는 어떻게 할지 정하는 클래스
// 요약하자면 상세보기 화면으로 넘어갈때는 흐리게 하고, 다시 돌아올때는 원상태로 되돌림
class FeedPresentationController: UIPresentationController {
    
    private lazy var blurView = UIVisualEffectView(effect: nil)
    
    override var shouldRemovePresentersView: Bool {
        return false
    }
    
    override func presentationTransitionWillBegin() {
        let container = containerView!
        blurView.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(blurView)
        blurView.edges(to: container)
        blurView.alpha = 0.0
        
        presentingViewController.beginAppearanceTransition(false, animated: false)
        presentedViewController.transitionCoordinator!.animate(alongsideTransition: { (ctx) in
            self.blurView.effect = UIBlurEffect(style: .light)
            self.blurView.alpha = 1
        }) { (ctx) in }
    }
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        presentingViewController.endAppearanceTransition()
    }
    
    override func dismissalTransitionWillBegin() {
        presentingViewController.beginAppearanceTransition(true, animated: true)
        presentedViewController.transitionCoordinator!.animate(alongsideTransition: { (ctx) in
            self.blurView.alpha = 0.0
        }, completion: nil)
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        presentingViewController.endAppearanceTransition()
        if completed {
            blurView.removeFromSuperview()
        }
    }
}
