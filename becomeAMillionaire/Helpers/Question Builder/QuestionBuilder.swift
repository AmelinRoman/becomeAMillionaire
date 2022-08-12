//
//  QuestionBuilder.swift
//  becomeAMillionaire
//
//  Created by Macbook Pro on 09.08.2022.
//

import UIKit

final class QuestionBuilder {
 // MARK: Private Properties
    private(set) var questions: [Question] = []
    private(set) var difficulty: [Difficulty] = [.easy]
    private(set) var question: [String] = []
    private(set) var answers: [[String]] = []
    private(set) var wrongAnswers: [[String]] = []
    private(set) var rightAnswer: [String] = []
    private(set) var numberRightAnswer: [Int] = []
// MARK: Functions
    func build(questionNumber: Int) -> [Question] {
        for number in 0..<questionNumber {
            questions.append(Question(difficulty: difficulty[number], question: question[number], answers: answers[number], wrongAnswers: wrongAnswers[number], ringhtAnswer: rightAnswer[number], correctNumberAnswer: numberRightAnswer[number]))
        }
        return questions
    }
    
    func setQuestion(_ question: String, number: Int) {
        self.question.insert(question, at: number)
    }
    
    func setAnswers(_ answers: [String], number: Int) {
        self.answers.insert(answers, at: number)
    }
    
    func setWrongAnswrs(_ wrongAnswers: [String], number: Int) {
        self.wrongAnswers.insert(wrongAnswers, at: number)
    }
    
    func setRinghtAnswer(_ rightAnswer: String, number: Int) {
        self.rightAnswer.insert(rightAnswer, at: number)
    }
    
    func setNumberRightAnswer(_ numberRightAnswer: Int, number: Int) {
        self.numberRightAnswer.insert(numberRightAnswer, at: number)
    }
    
    func setDifficulty(_ difficulty: Difficulty, number: Int) {
        self.difficulty.insert(difficulty, at: number)
    }
}
