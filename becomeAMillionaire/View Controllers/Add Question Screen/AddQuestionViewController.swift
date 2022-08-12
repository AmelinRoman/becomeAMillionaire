//
//  AddQuestionViewController.swift
//  becomeAMillionaire
//
//  Created by Macbook Pro on 12.08.2022.
//
import UIKit
//MARK: Protocol
protocol AddQuestionDelegate: AnyObject {
    
    func didAddQuestion(question: [Question])
}

final class AddQuestionViewController: UIViewController {
// MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonAddQuetion: UIButton!
    @IBOutlet weak var buttonWriteAnotherQuestion: UIButton!
// MARK: Properties
    weak var delegate: AddQuestionDelegate?
    private let builder = QuestionBuilder()
    private var errorAlertController: UIAlertController {
        let alertController = UIAlertController(title: "Ошибка", message: "Проверьте заполнены ли все поля", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Хорошо", style: .cancel, handler: nil))
        return alertController
    }
    var numberQuestion = 1
// MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        delegate = Game.shared
        tableView.register(AddQuestionTableViewCell.self)
    }
    
// MARK: IBAction
    @IBAction func addOneQuestionToWrite(_ sender: Any) {
        guard numberQuestion < 3 else {
            let alertController = UIAlertController(title: "Стоп", message: "Максимально можно написать за раз только 3 вопроса", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Хорошо", style: .cancel, handler: nil))
            present(alertController, animated: true)
            return
        }
        numberQuestion += 1
        tableView.reloadData()
    }
    
    @IBAction func addQuestionDateBase(_ sender: Any) {
        if setupBuilder() {
            delegate?.didAddQuestion(question: builder.build(questionNumber: numberQuestion))
            let alertController = UIAlertController(title: "Отлично!", message: "Вопросы добавлены", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Хорошо", style: .cancel, handler: exitToMenu))
            present(alertController, animated: true)
        }

    }
// MARK: Private Functions
    private func setupBuilder() -> Bool {
        for number in 0..<numberQuestion {
            let indexPath: IndexPath = [0,number]
            if let cell = tableView.cellForRow(at: indexPath) as? AddQuestionTableViewCell {
                if let question = cell.questionTextField.text {
                    guard question != "" else {
                        present(errorAlertController, animated: true)
                        return false
                    }
                    builder.setQuestion(question, number: number)
                }
                var textFieldCollection: [UITextField] {[cell.answerATextField, cell.answerBTextField, cell.answerCTextField, cell.answerDTextField]}
                var answers: [String] = []
                var wrongAnswers: [String] = []
                for answerTextFields in textFieldCollection {
                    if let answersText = answerTextFields.text {
                        if answersText != "" {
                            answers.append(answersText)
                        } else {
                            present(errorAlertController, animated: true)
                            return false
                        }
                    }
                }
                builder.setRinghtAnswer(answers[cell.correctAnswerController.selectedSegmentIndex], number: indexPath.row)
                builder.setWrongAnswrs(answers, number: indexPath.row)
                builder.setAnswers(answers, number: indexPath.row)
                builder.setNumberRightAnswer(cell.correctAnswerController.selectedSegmentIndex, number: indexPath.row)
                switch cell.difficultySegmentController.selectedSegmentIndex {
                case 0: builder.setDifficulty(.easy, number: indexPath.row)
                case 1: builder.setDifficulty(.medium, number: indexPath.row)
                case 2: builder.setDifficulty(.hard, number: indexPath.row)
                default: builder.setDifficulty(.easy, number: indexPath.row)
                }
            }
        }
        return true
    }
    
    private func exitToMenu(action: UIAlertAction! = nil) {
        navigationController?.popViewController(animated: true)
    }
}


