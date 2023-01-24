//
//  StartViewController.swift
//  RxSwiftMVVM
//
//  Created by ukBook on 2023/01/22.
//

import UIKit
import Then
import SnapKit

class StartViewController: UIViewController, ViewControllerAttributes {
    func setUI() {
        self.view.addSubview(tableView)
    }
    
    func setAttributes() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        _ = ["RxSwift 로그인 예제 (하드코딩)", "RxSwift 로그인 예제 (서버 통신)", "RxSwift 날씨 API"].map {
            tableViewArray.append($0)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func bindRx() {
        
    }
    
    
    var tableViewArray = [String]()
    lazy var tableView = UITableView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(StartTableViewCell.self, forCellReuseIdentifier: "customCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setAttributes()
    }
    
}

extension StartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! StartTableViewCell
        cell.label.text = tableViewArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let VC = LoginViewController()
            VC.titleString = tableViewArray[indexPath.row]
            self.navigationController?.pushViewController(VC, animated: true)
        case 1:
            let VC = LoginNetworkViewController()
            VC.titleString = tableViewArray[indexPath.row]
            self.navigationController?.pushViewController(VC, animated: true)
        case 2:
            let VC = WeatherViewController()
            VC.titleString = tableViewArray[indexPath.row]
            self.navigationController?.pushViewController(VC, animated: true)
        default:
            print("default")
        }
    }
    
}

