//
//  User'sQuestionViewController.swift
//  becomeAMillionaire
//
//  Created by Macbook Pro on 12.08.2022.
//

import UIKit

final class UsersQuestionsViewController: UIViewController {
    
// MARK: @IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
// MARK: IBAction
    @IBAction func pressClearQuestions(_ sender: Any) {
        let alertController = UIAlertController(title: "Вы уверены?", message: "Все вопросы будут удалены", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Хорошо", style: .default, handler: clearQuestions))
        alertController.addAction(UIAlertAction(title: "Отменить", style: .cancel, handler: nil))
        present(alertController, animated: true)
    }
    
    @IBAction func exitToMenu(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
// MARK: Function
    private func clearQuestions(action: UIAlertAction! = nil) {
        Game.shared.clearQuestion()
        self.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
}
