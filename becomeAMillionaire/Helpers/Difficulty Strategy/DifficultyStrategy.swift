//
//  DifficultyStrategy.swift
//  becomeAMillionaire
//
//  Created by Macbook Pro on 09.08.2022.
//

import Foundation

protocol DifficultyStrategy: AnyObject {
    func complexityOfQuestions() -> [Question]
}

