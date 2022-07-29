//
//  FeedDetailViewControllerAdmin.swift
//  GiveCake
//
//  Created by seojeon22 on 2022/07/27.
//

import UIKit

class FeedDetailViewControllerAdmin: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    var dismissClosure: (()->())?
    var interactiveStartingPoint: CGPoint? = nil
    var draggingDownToDismiss = false
    let selectedIdx: Int
    let cell: FeedTableViewCellAdmin!
    
    // 모달 내리듯이 드래그 하는 제스처
    private lazy var dismissPanGesture: UIPanGestureRecognizer = {
        let ges = UIPanGestureRecognizer()
        ges.maximumNumberOfTouches = 1
        ges.addTarget(self, action: #selector(handleDismissPan(gesture:)))
        ges.delegate = self
        return ges
    }()
    
    // 상세보기 화면의 스크롤 뷰
    lazy var scrollView: DetailScrollViewAdmin = {
        let frame = self.view.bounds
        let view = DetailScrollViewAdmin(frame: frame, selectedIdx: selectedIdx)
        view.delegate = self
        return view
    }()
    
    // 상세보기 화면의 오른쪽 위 x 버튼
    lazy var closeBtn: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: kScreenW - 20 - 30, y: 20, width: 30, height: 30)
        btn.setImage(#imageLiteral(resourceName: "close_button"), for: .normal)
        btn.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        return btn
    }()
    
    init(cell: FeedTableViewCellAdmin, selectedIdx: Int) {
        self.cell = cell
        self.selectedIdx = selectedIdx
        super.init(nibName: nil, bundle: nil)
        self.setupTranstion()
    }
    
    // 모달 애니메이션을 커스텀 하는걸로 정함
    private func setupTranstion() {
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getImageFromCell()
    }
    
    // 상세보기 화면의 큰 틀 세팅
    private func setupUI() {
        self.view.backgroundColor = .white
        self.view.layer.masksToBounds = true
        view.addSubview(scrollView)
        view.addSubview(closeBtn)
        view.addGestureRecognizer(dismissPanGesture)
        
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    // 테이블 셀의 이미지를 그대로 상세보기 이미지로 가져옴
    private func getImageFromCell() {
        scrollView.imageView.image = cell.bgImageView.image
    }
    
    // 상세보기 화면에서 나가기
    @objc private func closeAction() {
        dismiss(animated: true, completion: nil)
        dismissClosure?()
    }
    
    // 모달 내리듯이 드래그 하는 제스처로 할 행동
    @objc private func handleDismissPan(gesture: UIPanGestureRecognizer) {
        if !draggingDownToDismiss {
            return
        }

        let startingPoint: CGPoint
        
        if let p = interactiveStartingPoint {
            startingPoint = p
        } else {
            startingPoint = gesture.location(in: nil)
            interactiveStartingPoint = startingPoint
        }

        let currentLocation = gesture.location(in: nil)
        
        var progress = (currentLocation.y - startingPoint.y) / 100
        
        if currentLocation.y <= startingPoint.y {
            progress = 0
        }
        
        if progress >= 1.0 {
            dismiss(animated: true, completion: nil)
            dismissClosure?()
            stopDismissPanGesture(gesture)
            return
        }

        let targetShrinkScale: CGFloat = 0.86
        let currentScale: CGFloat = 1 - (1 - targetShrinkScale) * progress
        
        switch gesture.state {
        case .began,.changed:
            scrollView.isScrollEnabled = false
            gesture.view?.transform = CGAffineTransform(scaleX: currentScale, y: currentScale)
            gesture.view?.layer.cornerRadius = GlobalConstants.feedCardCornerRadius * (progress)
            scrollView.showsVerticalScrollIndicator = false
        case .cancelled,.ended:
            scrollView.isScrollEnabled = true
            stopDismissPanGesture(gesture)
        default:
            break
        }
    }
    
    // 모달 내리듯이 드래그 하다가 중간에 취소할 때 되돌아가기
    private func stopDismissPanGesture(_ gesture: UIPanGestureRecognizer) {
        interactiveStartingPoint = nil
        draggingDownToDismiss = false
        scrollView.showsVerticalScrollIndicator = true
        UIView.animate(withDuration: 0.2) {
            gesture.view?.transform = CGAffineTransform.identity
        }
    }

}

// 만들어둔 뷰전환 커스텀 애니메이션 적용시키기
extension FeedDetailViewControllerAdmin: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FeedAnimationTransitionAdmin(animationType: .present)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FeedAnimationTransitionAdmin(animationType: .dismiss)
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return FeedPresentationControllerAdmin(presentedViewController: presented, presenting: presenting)
    }
}

// 스크롤뷰의 드래그와 뒤로가기용 드래그가 공존하기 위한 코드
extension FeedDetailViewControllerAdmin: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            scrollView.contentOffset = .zero
            draggingDownToDismiss = true
        }
    }
    
    
}

// 제스처 인식하기
extension FeedDetailViewControllerAdmin: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
