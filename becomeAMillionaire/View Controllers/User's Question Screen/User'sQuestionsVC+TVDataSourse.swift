//
//  User'sQuestionsVC+TVDataSourse.swift
//  becomeAMillionaire
//
//  Created by Macbook Pro on 12.08.2022.
//
import UIKit

extension UsersQuestionsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Game.shared.userQuestion.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        setupCell(for: indexPath)
    }
    
    private func setupCell(for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usersQuestionsCell", for: indexPath)
        let questions = Game.shared.userQuestion[indexPath.row]
        var difficulty: String {
            switch questions.difficulty {
            case .easy: return "Легкий"
            case .medium: return "Средний"
            case .hard: return "Сложный"
            }
        }
        var rightAnswerLetter: String {
            switch questions.correctNumberAnswer {
            case 0: return "A"
            case 1: return "B"
            case 2: return "C"
            case 3: return "D"
            default: return "Error"
            }
        }
        cell.textLabel?.text = """
                               Вопрос №\(indexPath.row + 1): \(questions.question)
                               Ответы:
                                    А: \(questions.answers[0])
                                    B: \(questions.answers[1])
                                    C: \(questions.answers[2])
                                    D: \(questions.answers[3])
                               Правильный ответ: \(rightAnswerLetter)
                               Сложность: \(difficulty)
                               """
        cell.textLabel?.numberOfLines = 10
        cell.textLabel?.textColor = .blue
        cell.selectionStyle = .none
        return cell
    }
}
