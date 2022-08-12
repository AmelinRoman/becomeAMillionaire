//
//  QuestionCaretaker.swift
//  becomeAMillionaire
//
//  Created by Macbook Pro on 09.08.2022.
//

import Foundation

final class QuestionCaretaker {
// MARK: Private Properties
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "question"
// MARK: Function
    func save(question: [Question]) {
        
        do {
            let data = try encoder.encode(question)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func getSavedQuestion() -> [Question] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return []}
        
        do {
            return try decoder.decode([Question].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
