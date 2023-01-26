//
//  KioskViewController.swift
//  RxSwiftMVVM
//
//  Created by ukBook on 2023/01/26.
//

import Foundation
import UIKit
import RxSwift

class KioskViewController: UIViewController, ViewControllerAttributes {
    let disposeBag = DisposeBag()
    var titleString : String?
    let tableViewHeight : CGFloat = {
        let height = UIScreen.main.bounds.height
        return height * 0.6
    }()
    let tableView = UITableView().then {
        $0.backgroundColor = .yellow
    }
    let bottomView = UIView().then {
        $0.backgroundColor = .systemGray4
    }
    
    let orderBtn = UIButton().then {
        $0.setTitle("ORDER", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = .black
    }

    override func viewDidLoad() {
        setUI()
        setAttributes()
        bindRx()
    }
    
    func setUI() {
        guard let title = titleString else {return}
        self.navigationItem.title = title
        
        self.view.addSubview(tableView)
        self.view.addSubview(bottomView)
        self.view.addSubview(orderBtn)
    }
    
    func setAttributes() {
        tableView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(tableViewHeight)
        }
        
        bottomView.snp.makeConstraints {
            $0.top.equalTo(tableView.snp.bottom)
            $0.bottom.equalTo(orderBtn.snp.top)
            $0.left.right.equalToSuperview()
        }
        
        orderBtn.snp.makeConstraints {
            $0.bottom.equalTo(self.view.snp.bottom)
            $0.height.equalTo(100)
            $0.left.right.equalToSuperview()
        }
    }
    
    func bindRx() {
        
        
        //order button Event
        orderBtn.rx.tap.subscribe { event in
            print("event")
        }
    }
}
