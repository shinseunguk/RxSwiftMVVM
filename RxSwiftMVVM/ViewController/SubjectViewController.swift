//
//  SubjectViewController.swift
//  RxSwiftMVVM
//
//  Created by plsystems on 2023/01/25.
//

import Foundation
import UIKit
import RxSwift

class SubjectViewController: UIViewController, ViewControllerAttributes {
    let disposeBag = DisposeBag()
    let viewModel = SubjectViewModel()
    var titleString : String?
    
    let publishSubjectTextField = UITextField().then {
        $0.layer.borderWidth = 1
        $0.placeholder = "publishSubject"
    }
    let publishSubjectLabel = UILabel().then {
        $0.text = "publishSubject 입력 받기전"
        $0.sizeToFit()
        $0.textAlignment = .center
    }
    let behaviorSubjectTextField = UITextField().then {
        $0.layer.borderWidth = 1
        $0.placeholder = "behaviorSubject"
    }
    let behaviorSubjectLabel = UILabel().then {
        $0.text = "behaviorSubject 입력 받기전"
        $0.sizeToFit()
        $0.textAlignment = .center
        $0.sizeToFit()
    }
    let replaySubjectTextField = UITextField().then {
        $0.layer.borderWidth = 1
        $0.placeholder = "replaySubject"
    }
    let replaySubjectLabel = UILabel().then {
        $0.text = "replaySubject 입력 받기전"
        $0.sizeToFit()
        $0.textAlignment = .center
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
        
        self.view.addSubview(publishSubjectTextField)
        self.view.addSubview(publishSubjectLabel)
        self.view.addSubview(behaviorSubjectTextField)
        self.view.addSubview(behaviorSubjectLabel)
        self.view.addSubview(replaySubjectTextField)
        self.view.addSubview(replaySubjectLabel)
    }
    
    func setAttributes() {
        publishSubjectTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.width.equalTo(150)
            $0.height.equalTo(40)
        }
        publishSubjectLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(publishSubjectTextField.snp.bottom)
        }
        behaviorSubjectTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(publishSubjectLabel.snp.bottom).offset(20)
            $0.width.equalTo(150)
            $0.height.equalTo(40)
        }
        behaviorSubjectLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(behaviorSubjectTextField.snp.bottom)
        }
        replaySubjectTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(behaviorSubjectLabel.snp.bottom).offset(20)
            $0.width.equalTo(150)
            $0.height.equalTo(40)
        }
        replaySubjectLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(replaySubjectTextField.snp.bottom)
        }
    }
    
    func bindRx() {
        publishSubjectTextField.rx.text
            .orEmpty
            .distinctUntilChanged()
            .filter{ $0.count > 8 }
            .bind(to: viewModel.publishSubject)
            .disposed(by: disposeBag)
        
        viewModel.textFieldTextPublishSubject
            .bind(to: publishSubjectLabel.rx.text)
            .disposed(by: disposeBag)
        
        behaviorSubjectTextField.rx.text
            .orEmpty
            .distinctUntilChanged()
            .bind(to: viewModel.behaviorSubject)
            .disposed(by: disposeBag)
        
        viewModel.textFieldTextBehaviorSubject
            .bind(to: behaviorSubjectLabel.rx.text)
            .disposed(by: disposeBag)
        
        replaySubjectTextField.rx.text
            .orEmpty
            .distinctUntilChanged()
            .bind(to: viewModel.replaySubject)
            .disposed(by: disposeBag)
        
        viewModel.textFieldTextReplaySubject
            .bind(to: replaySubjectLabel.rx.text)
            .disposed(by: disposeBag)
        
        
    }
}
