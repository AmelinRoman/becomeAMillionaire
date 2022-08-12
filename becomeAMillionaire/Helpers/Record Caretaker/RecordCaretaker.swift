//
//  RecordCaretaker.swift
//  becomeAMillionaire
//
//  Created by Macbook Pro on 09.08.2022.
//

import Foundation

final class RecordCaretaker {
// MARK: Private Properties
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "records"
// MARK: Function
    func save(record: [Record]) {
        do {
            let data = try encoder.encode(record)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func getSavedRecord() -> [Record] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        
        do {
            return try decoder.decode([Record].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
