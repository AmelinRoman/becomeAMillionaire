//
//  Game.swift
//  becomeAMillionaire
//
//  Created by Macbook Pro on 09.08.2022.
//

import UIKit

final class Game {
// MARK: Singleton
    static let shared = Game()
    private init(){}
    
// MARK: Propeties
    private let recordCaretaker = RecordCaretaker()
    private let questionCaretaker = QuestionCaretaker()
    var gameSession: GameSession?
    var record = [Record]() {
        didSet{
            recordCaretaker.save(record: record)
        }
    }
    var userQuestion = [Question]() {
        didSet {
            questionCaretaker.save(question: userQuestion)
        }
    }
// MARK: Function
    func addRecord(record: Record) {
        self.record.append(record)
    }
    
    func clearRecord() {
        record = []
    }
    
    func addQuestion(question: [Question]) {
        self.userQuestion.append(contentsOf: question)
    }
    
    func clearQuestion() {
        userQuestion = []
    }
}

// MARK: Extension
extension Game: GameSceneDelegate {
    func endGame(dificulty: Difficulty, playerName: String, playerScore: Int, callFriend: Bool, fiftyFifty: Bool, hallHelp: Bool) {
        let newRecord = Record(difficulty: dificulty, userName: playerName, date: Date(), score: playerScore, callFriend: callFriend, hallHelp: hallHelp, fiftyFifty: fiftyFifty)
        Game.shared.addRecord(record: newRecord)
    }
}

extension Game: AddQuestionDelegate {
    func didAddQuestion(question: [Question]) {
        Game.shared.addQuestion(question: question)
    }   
}
