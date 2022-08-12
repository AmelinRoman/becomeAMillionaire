//
//  DifficultyFacade.swift
//  becomeAMillionaire
//
//  Created by Macbook Pro on 09.08.2022.
//

import UIKit

final class DifficultyFacade {
// MARK: Properties
    let difficulty: Difficulty
    private var createQuestionDiffilcultyStrategy: DifficultyStrategy {
        switch difficulty {
        case .easy: return EasyDifficultyStrategy()
        case .medium: return MediumDifficultyStrategy()
        case .hard: return HardDifficultyStrategy()
        }
    }
// MARK: Init
    init(difficulty: Difficulty) {
        self.difficulty = difficulty
    }
// MARK: Function
    func settingpGame() -> [Question] {
        return createQuestionDiffilcultyStrategy.complexityOfQuestions()
    }
}
