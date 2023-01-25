//
//  SubjectViewModel.swift
//  RxSwiftMVVM
//
//  Created by plsystems on 2023/01/25.
//

import Foundation
import RxSwift
import RxRelay

class SubjectViewModel {
    
    
    // MARK: - SubJect는 RxSwift / .completed, .error의 이벤트가 발생하면 subscribe가 종료되는 반면
    let publishSubject = PublishSubject<String>() // .completed, .error의 이벤트가 발생할때까지 subscribe한 이후부터 이벤트를 방출
    let behaviorSubject = BehaviorSubject<String>(value: "입력 하기도 전") // PublishSubject와 유사하지만, 초기값을 가짐. PublishSubject와 달리 항상 직전의 값부터 구독 초기값이 없다면 PublishSubject를 사용
    let replaySubject = ReplaySubject<String>.create(bufferSize: 3) // 생성시 선택한 특정 크기만큼 일시적으로 캐시하거나 버퍼를 저장해서 최신 요소를 모두 방출 ex) 최근 검색어 같은 곳에 사용하면 좋을듯.
    let asyncSubject = AsyncSubject<String>() // Observable로부터 배출된 마지막 값(만)을 배출함

    // MARK: - Relay는 RxCocoa / .completed, .error를 발생하지 않고 Dispose되기 전까지 계속 작동하기 때문에 UIEvent에서 사용하기 적절
    let publishRelay = PublishRelay<String>()
    let behaviorRelay = BehaviorRelay<String>(value: "")

    var textFieldTextPublishSubject: Observable<String> {
        return publishSubject.asObservable().map { asd in
            return "\(asd) publishRelay"
        }
    }
    
    var textFieldTextBehaviorSubject: Observable<String> {
        return behaviorSubject.asObservable().map { asd in
            return "\(asd) behaviorSubject"
        }
    }
    
    var textFieldTextReplaySubject: Observable<String> {
        return replaySubject.asObservable().map { asd in
            return "\(asd) replaySubject"
        }
    }
}
