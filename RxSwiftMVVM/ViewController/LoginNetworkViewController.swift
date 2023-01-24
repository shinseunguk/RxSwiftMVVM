//
//  LoginNetworkViewController.swift
//  RxSwiftMVVM
//
//  Created by ukBook on 2023/01/23.
//

import Foundation
import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class LoginNetworkViewController : UIViewController, ViewControllerAttributes {
    let viewModel = LoginViewModel()
    let disposeBag = DisposeBag() // RxSwift
    
    var titleString : String?
    
    
    var tableViewArray = [String]()
    lazy var tableView = UITableView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(StartTableViewCell.self, forCellReuseIdentifier: "customCell")
    }
    
    lazy var idTextField = UITextField().then {
        $0.placeholder = "아이디"
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 5
    }
    lazy var passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 5
        $0.isSecureTextEntry = true
    }
    lazy var loginBtn = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 5
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setAttributes()
        bindRx()
    }
    
    func setUI() {
        guard let title = titleString else {return}
        self.navigationItem.title = title
        
        self.view.addSubview(idTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginBtn)
    }
    
    func setAttributes() {
        idTextField.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(40)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(40)
        }
        loginBtn.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(40)
        }
    }
    
    func bindRx() {
        idTextField.rx.text
            .orEmpty // RxCocoa
            .bind(to: viewModel.emailObserver)
            .disposed(by: disposeBag) // RxSwift
        
        passwordTextField.rx.text
            .orEmpty // RxCocoa
            .bind(to: viewModel.passwordObserver)
            .disposed(by: disposeBag) // RxSwift
        
        viewModel.isValid.bind(to: loginBtn.rx.isEnabled)
            .disposed(by: disposeBag)
        
        viewModel.isValid
            .map{ $0 ? 1 : 0.3 }
            .bind(to: loginBtn.rx.alpha)
            .disposed(by: disposeBag)
        
//        loginBtn.rx.tap.subscribe(
//            onNext: { [weak self] _ in
//                if self?.userEmail == self?.viewModel.emailObserver.value && self?.userPassword == self?.viewModel.passwordObserver.value{
//                    let alert = UIAlertController(title: "로그인 성공", message: "환영합니다", preferredStyle: .alert)
//                    let ok = UIAlertAction(title: "확인", style: .default)
//                    alert.addAction(ok)
//                    self?.present(alert, animated: true, completion: nil)
//                } else {
//                    let alert = UIAlertController(title: "로그인 실패", message: "아이디 혹은 비밀번호를 다시 확인해주세요", preferredStyle: .alert)
//                    let ok = UIAlertAction(title: "확인", style: .default)
//                    alert.addAction(ok)
//                    self?.present(alert, animated: true, completion: nil)
//                }
//            }
//        ).disposed(by: disposeBag)
    }
    
}
