//
//  WeatherViewController.swift
//  RxSwiftMVVM
//
//  Created by ukBook on 2023/01/24.
//

import Foundation
import UIKit
import Then
import RxSwift
import SnapKit

class WeatherViewController: UIViewController, ViewControllerAttributes {
    let disposeBag = DisposeBag()
    let viewModel = WeatherViewModel()
    let allCities = ["NewYork", "London", "Paris", "Osaka", "Osagu", "Seoul"]
    var shownCities = [String]()
    
    var titleString : String?
    
    let titleView = UIView()
    let searchView = UISearchBar().then {
//        $0.backgroundColor = .black
        $0.layer.cornerRadius = 5
    }
    let tableView = UITableView().then {
        $0.register(WeatherTableViewCell.self, forCellReuseIdentifier: "cityPrototypeCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.backgroundColor = .yellow
        
        setUI()
        setAttributes()
        bindRx()
    }
    
    func setUI() {
        self.navigationItem.titleView = searchView
        self.view.addSubview(tableView)
        
    }
    
    func setAttributes() {
        searchView.snp.makeConstraints {
            $0.width.equalTo(200)
            $0.height.equalTo(30)
        }
        tableView.snp.makeConstraints {
            $0.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    func bindRx() {
        searchView.rx.text
            .orEmpty
              .distinctUntilChanged() // 새로운 값이 이전과 같은지 체크 (O -> Oc -> O 값이 이전과 같으므로 다음으로 안넘어감)
              .filter({ !$0.isEmpty })
              .subscribe(onNext: { [unowned self] query in
                print(query)
                self.shownCities = self.allCities.filter({ $0.hasPrefix(query) })
                self.tableView.reloadData()
              })
              .disposed(by: disposeBag)
    }
}

extension WeatherViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return shownCities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cityPrototypeCell", for: indexPath) as! WeatherTableViewCell
      cell.textLabel?.text = shownCities[indexPath.row]

      return cell
    }
}

