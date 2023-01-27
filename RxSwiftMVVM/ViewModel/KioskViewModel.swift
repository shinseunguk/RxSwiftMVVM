//
//  KioskViewModel.swift
//  RxSwiftMVVM
//
//  Created by ukBook on 2023/01/26.
//

import Foundation
import RxSwift

final class KioskViewModel {
    
    func getList() -> Observable<[menu]>{
        return Observable<[menu]>.create { observer -> Disposable in
            KioskAPI.fetchAllMenus { result in
                switch result {
                case let .success(data) :
                    struct Response: Decodable {
                        let menus: [menu]
                    }
                    guard let response = try? JSONDecoder().decode(Response.self, from: data) else { print("else"); return }
                    break
                case let .failure(err) :
                    print(err)
                    break
                }
                
            }
            return Disposables.create()
        }
        
    }
}
