//
//  Records.swift
//  becomeAMillionaire
//
//  Created by Macbook Pro on 09.08.2022.
//

import Foundation

struct Record: Codable {
    let difficulty: Difficulty
    let userName: String
    let date: Date
    let score: Int
    let callFriend: Bool
    let hallHelp: Bool
    let fiftyFifty: Bool
}
