//
//  LoginViewModel.swift
//  RxSwiftMVVM
//
//  Created by ukBook on 2023/01/23.
//

import Foundation
import RxSwift
import RxRelay

class LoginViewModel {
    var textEmail : String = ""
    // MARK: -  아이디, 비밀번호 유효성 체크
    let emailObserver = BehaviorRelay<String>(value: "")
    let passwordObserver = BehaviorRelay<String>(value: "")
    
    /// 아이디 비밀번호 유효성 체크
    var isValid: Observable<Bool> {
        return emailObserver.asObservable().map { email in
            self.textEmail = self.emailObserver.value
            print("self.textEmail \(self.textEmail)")
            return email.count > 3
        }
    }
    
    var hi: Observable<String> {
        return Observable.just(emailObserver.value)
    }
    
    func loginSuccess() -> Bool {
        if textEmail == "asdasd123" {
            return true
        }else {
            return false
        }
    }
    
    ///  Alamofire 로그인
//    func login(param: Dictionary<String, String>) -> Observable<User> {
//
//            return Observable.create({ (observer) -> Disposable in
//
//                print("LOGIN!") // 요기다가 비지니스 로직 (네트워크를 타고 온 것들)
//
//                observer.onNext(User(name: info.id ?? ""))
//
//                return Disposables.create()
//
//            })
//        }
}
