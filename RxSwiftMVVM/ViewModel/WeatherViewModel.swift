//
//  WeatherViewModel.swift
//  RxSwiftMVVM
//
//  Created by ukBook on 2023/01/24.
//

import Foundation
import RxSwift
import RxRelay

class WeatherViewModel {
    let searchObserver = BehaviorRelay<String>(value: "")
    
    func text(_ str: PublishSubject<String>) -> Observable<String> {
        return str.asObservable()
    }
}
