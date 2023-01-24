//
//  User.swift
//  RxSwiftMVVM
//
//  Created by ukBook on 2023/01/23.
//

import Foundation

struct User: Codable {
    let result: Info
}

struct Info: Codable {
    let userSeq : Int?
    let userEmail: String?
    let userNickname: String?
    let major1: String?
    let major2: String?
    let socialType: String?
    let follower: Int?
    let following: Int?
    let introduce: String?
    let profileImageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case userSeq = "userSeq"
        case userEmail = "userEmail"
        case userNickname = "userNickname"
        case major1 = "major1"
        case major2 = "major2"
        case socialType = "social_type"
        case follower = "follower"
        case following = "following"
        case introduce = "introduce"
        case profileImageUrl = "profileImageUrl"
    }
}
