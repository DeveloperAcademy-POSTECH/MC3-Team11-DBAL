//
//  TodayViewController.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/16.
//

import UIKit

class FeedViewController: UITableViewController {
    
    var selectedCell: FeedTableViewCell?
    
    var statusBarShouldBeHidden = false
    
    override var prefersStatusBarHidden: Bool {
        return statusBarShouldBeHidden
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    // 테이블 헤더 뷰 (모아보기 글자 써있는 부분)
    lazy var headerView: FeedTableHeaderView = {
        let frame = CGRect(x: 0, y: 0, width: kScreenW, height: 96)
        let view = FeedTableHeaderView(frame: frame)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    // 테이블 뷰 세팅하기 (헤더 + 테이블 셀들)
    private func setupTableView() {
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: "\(FeedTableViewCell.self)")
        tableView.separatorStyle = .none
        tableView.rowHeight = GlobalConstants.feedCardRowH
        tableView.tableHeaderView = headerView
    }
    
    // 스테이터스바 사라지거나 나타나게 하기 (시간이랑 배터리 표시되는 부분)
    private func updateStatusBarAndTabbarFrame(visible: Bool) {
        statusBarShouldBeHidden = !visible
        UIView.animate(withDuration: 0.25) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }

    // TODO: feed 개수를 반환해야함
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    // 테이블 셀 설정하기
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(FeedTableViewCell.self)", for: indexPath) as! FeedTableViewCell
        cell.selectionStyle = .none
        cell.bgImageView.image = GiverFeedModel.instance.feedList[indexPath.row].image
        return cell
    }
    
    // 테이블 셀 누르고 있을 때 일어나는 반응 (셀 크기가 살짝 작아짐)
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        guard let row = tableView.cellForRow(at: indexPath) as? FeedTableViewCell else { return }
        UIView.animate(withDuration: 0.1) {
            row.bgBackView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
    }
    
    // 테이블 셀 누르고 있는 거 취소됐을때 일어나는 반응 (셀 크기가 원상태로 돌아옴)
    override func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        guard let row = tableView.cellForRow(at: indexPath) as? FeedTableViewCell else { return }
        UIView.animate(withDuration: 0.3) {
            row.bgBackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
    }

    // 테이블 셀 클릭했을 때 일어나는 반응 (상세 보기 화면으로 이동)
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // 현재 클릭된 셀
        guard let cell = tableView.cellForRow(at: indexPath) as? FeedTableViewCell else { return }
        selectedCell = cell
        
        // 현재 클릭된 셀에 대한 상세보기 화면
        let detailVC = FeedDetailViewController(cell: cell, selectedIdx: indexPath.row)
        
        // 상세보기 화면에서 다시 돌아올 경우, 스테이터스바(시간, 배터리 부분) 나타나게 하기
        detailVC.dismissClosure = { [weak self] in
            guard let StrongSelf = self else { return }
            StrongSelf.updateStatusBarAndTabbarFrame(visible: true)
        }
        
        // 스테이터스바(시간, 배터리 부분) 사라지게 하기
        updateStatusBarAndTabbarFrame(visible: false)
        
        // 상세보기 화면으로 뷰 전환
        present(detailVC, animated: true, completion: nil)

    }
}
