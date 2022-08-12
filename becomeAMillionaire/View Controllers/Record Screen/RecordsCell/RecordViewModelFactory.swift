//
//  RecordViewModelFactory.swift
//  becomeAMillionaire
//
//  Created by Macbook Pro on 11.08.2022.
//

import UIKit

final class RecordViewModelFactory {
 // MARK: Properties
    // Разгружаем View и выносим DateFormatter в Фабрику
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter
    }()
// MARK: Functions
    func constructorViewModels(from records: [Record]) -> [RecordViewModel] {
        // Делаем сортировку по рекорду и возвращаем готовую модель
        var newArrayRecords = records.sorted { $0.score > $1.score}
        return newArrayRecords.compactMap(self.viewModel)
    }
    
    private func viewModel(from record: Record) -> RecordViewModel {
     // подготавливаем ViewModel
        var numberHintCount: Int {
            var number = 0
            if record.fiftyFifty { number += 1 }
            if record.callFriend { number += 1 }
            if record.hallHelp { number += 1 }
            return number
        }
        let countHintText = String(numberHintCount)
        let nameText = record.userName
        let dateText = RecordViewModelFactory.dateFormatter.string(from: record.date)
        let scoreText = String(record.score)
        
        return RecordViewModel(modelNameLabel: nameText, modelDateLabel: dateText, modelCountHint: countHintText, modelScore: scoreText)
    }
}
