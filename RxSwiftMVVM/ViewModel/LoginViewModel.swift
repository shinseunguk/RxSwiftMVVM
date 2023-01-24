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
    // MARK: -  아이디, 비밀번호 유효성 체크
    let emailObserver = BehaviorRelay<String>(value: "")
    let passwordObserver = BehaviorRelay<String>(value: "")
    
    /// 아이디 비밀번호 유효성 체크
    var isValid: Observable<Bool> {
        return Observable.combineLatest(emailObserver, passwordObserver).map { email, password in
            print("Email : \(email), password : \(password)")
            print(!email.isEmpty && email.contains("@") && email.contains(".") && password.count > 5)
            return !email.isEmpty && email.contains("@") && email.contains(".") && password.count > 5
        }
    }
    
    var hi: Observable<String> {
        return Observable.just(emailObserver.value)
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
