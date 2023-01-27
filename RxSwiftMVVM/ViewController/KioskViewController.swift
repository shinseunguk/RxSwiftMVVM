//
//  KioskViewController.swift
//  RxSwiftMVVM
//
//  Created by ukBook on 2023/01/26.
//

import Foundation
import UIKit
import RxSwift

final class KioskViewController: UIViewController, ViewControllerAttributes {
    let url = "https://firebasestorage.googleapis.com/v0/b/rxswiftin4hours.appspot.com/o/fried_menus.json?alt=media&token=42d5cb7e-8ec4-48f9-bf39-3049e796c936"
    let disposeBag = DisposeBag()
    let viewModel = KioskViewModel()
    var titleString : String?
    var menus : [menu]?
    
    var menuItems: [(menu: menu, count: Int)] = []
    
    let tableViewHeight : CGFloat = {
        let height = UIScreen.main.bounds.height
        return height * 0.6
    }()
    lazy var tableView = UITableView().then {
        $0.backgroundColor = .yellow
        $0.register(KioskTableViewCell.self, forCellReuseIdentifier: "KioskCell")
        $0.delegate = self
        $0.dataSource = self
    }
    let bottomView = UIView().then {
        $0.backgroundColor = .systemGray4
    }
    let itemCountLabel = UILabel().then {
        $0.text = "0 items"
    }
    let totalPrice = UILabel().then {
        $0.text = "0 원"
    }
    
    let orderBtn = UIButton().then {
        $0.backgroundColor = .black
    }
    let orderLabel = UILabel().then {
        $0.textColor = .white
        $0.backgroundColor = .black
        $0.text = "ORDER"
        $0.font = .boldSystemFont(ofSize: 20)
        $0.sizeToFit()
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
        
        self.orderBtn.addSubview(orderLabel)
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
        
        orderLabel.snp.makeConstraints {
            $0.top.equalTo(orderBtn.snp.top).offset(20)
            $0.centerX.equalToSuperview()
        }
    }
    
    func bindRx() {
        //order button Event
        orderBtn.rx.tap.subscribe { event in
            print("event")
        }
        
        viewModel.getList()
            .subscribe { menu in
                print("menu \(menu)")
            }
    }
    
    private func updateTotalInfo() {
        let allCount = menuItems.map { $0.count }.reduce(0, +)
        let allPrice = menuItems.map { $0.menu.price * $0.count }.reduce(0, +)
        itemCountLabel.text = "\(allCount)"
        totalPrice.text = String(allPrice)
    }

    private func showAlert(_ title: String, _ message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertVC, animated: true, completion: nil)
    }
} 

extension KioskViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "KioskCell", for: indexPath) as! KioskTableViewCell
//        let item = menuItems[indexPath.row]
//
//        cell.foodLabel.text = item.menu.name
//        cell.priceLabel.text = "\(item.menu.price)"
//        cell.count.text = "\(item.count)"
//        cell.onCountChanged = { [weak self] inc in
//            guard let self = self else { return }
//            var count = item.count + inc
//            if count < 0 { count = 0 }
//            self.menuItems[indexPath.row] = (item.menu, count)
//
//            tableView.beginUpdates()
//            tableView.reloadRows(at: [indexPath], with: .automatic)
//            tableView.endUpdates()
//
//            self.updateTotalInfo()
//        }

        return cell
    }
}
