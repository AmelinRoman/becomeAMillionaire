//
//  RecordsViewController.swift
//  becomeAMillionaire
//
//  Created by Macbook Pro on 11.08.2022.
//

import UIKit

final class RecordsViewController: UIViewController {
 // MARK: IBOutlet
    @IBOutlet weak var controllerDifficulty: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
// MARK: IBAction
    @IBAction func selectedDifficultyController(_ sender: UISegmentedControl) {
        self.tableView.reloadData()
    }
    
    @IBAction func pressClearButton(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Вы уверены?", message: "Все ваши рекорды будут удалены", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Да", style: .default, handler: nil))
        alertController.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: nil))
        present(alertController, animated: true)
    }
    
    @IBAction func exitToMenu(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
// MARK: Properties
    private let viewModelFactory = RecordViewModelFactory()
    private var selectedDifficulty: Difficulty {
        switch controllerDifficulty.selectedSegmentIndex {
        case 0: return .easy
        case 1: return .medium
        case 2: return .hard
        default: return .easy
        }
    }
    var standartWidth: CGFloat { tableView.bounds.width }
    var standartHeight: CGFloat = 40
    var viewModels: [RecordViewModel] = []
    var recordsList: [Record] {
        switch selectedDifficulty {
        case .easy: return Game.shared.record.filter {$0.difficulty == .easy}
        case .medium: return Game.shared.record.filter {$0.difficulty == .medium }
        case .hard: return Game.shared.record.filter {$0.difficulty == .hard}
        }
    }
// MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(RecordsTableViewCell.self)
        self.viewModels = self.viewModelFactory.constructorViewModels(from: recordsList)
    }
    
    private func clearRecords(action: UIAlertAction! = nil) {
        Game.shared.clearRecord()
        self.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
}
