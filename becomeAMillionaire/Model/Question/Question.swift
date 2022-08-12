//
//  Question.swift
//  becomeAMillionaire
//
//  Created by Macbook Pro on 05.08.2022.
//

import Foundation

struct Question: Codable {
    let difficulty: Difficulty
    let question: String
    let answers: [String]
    let wrongAnswers: [String]
    var ringhtAnswer: String
    var correctNumberAnswer: Int
}

