//
//  RxSwiftMVVMTests.swift
//  RxSwiftMVVMTests
//
//  Created by ukBook on 2023/01/22.
//  https://fomaios.tistory.com/entry/iOS-Unit-Test에-대해서-간단히-알아보기
//  https://www.kodeco.com/21020457-ios-unit-testing-and-ui-testing-tutorial#toc-anchor-001
//  http://yoonbumtae.com/?p=4020

//1. setUpWithError
//테스트에서 가장 먼저 실행되는 메소드로 보통 어떤 모델이나 시스템을 정의하는 역할을 합니다.

//2. tearDown
//테스트에서 가장 마지막에 실행되는 메소드로 보통 정의했던 것들 해제시키는 역할을 합니다.

//3.testExample
//테스트를 할 코드를 작성하는 역할을 합니다.

//4. testPerformanceExample
//성능을 테스트하고 코드의 실행 속도를 테스트하는 역할을 합니다.

import XCTest
@testable import RxSwiftMVVM

final class RxSwiftMVVMTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        print("4321")
    }
    
    func testFunc() {
        print("1234")
        
        XCTAssert(true, "실패")
    }

    func testPerformanceExample() throws {
        measure(
          metrics: [
            XCTClockMetric(),
            XCTCPUMetric(),
            XCTStorageMetric(),
            XCTMemoryMetric()
          ]
        ) {
//          sut.check(guess: 100)
        }
      }

}
