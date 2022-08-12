//
//  ViewController.swift
//  becomeAMillionaire
//
//  Created by Macbook Pro on 05.08.2022.
//

import UIKit

final class MenuViewController: UIViewController {
 // MARK: IBOutlet
    @IBOutlet weak var difficultyControl: UISegmentedControl!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var recordsButton: UIButton!
    @IBOutlet weak var addQuestionButton: UIButton!
    
// MARK: Private Propertis
    private let segueIdentifier = "startGameSegue"
    private let recordCaretaker = RecordCaretaker()
    private let questionCaretaker = QuestionCaretaker()
    private var alertController = UIAlertController()
    private var selctedDifficultyControll: Difficulty {
        switch difficultyControl.selectedSegmentIndex {
        case 0: return .easy
        case 1: return .medium
        case 2: return .hard
        default: return .easy
        }
    }
// MARK: Properties
    var playerName: String = ""

// MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Game.shared.record = recordCaretaker.getSavedRecord()
        Game.shared.userQuestion = questionCaretaker.getSavedQuestion()
        showAlertController()
    }
// MARK: IBAction
    @IBAction func pressStartGame(_ sender: Any) {
        present(alertController, animated: true)
    }
// MARK: Override Functions
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch identifier {
        case segueIdentifier: return
            playerName != ""
        default: return true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            guard
                let destination = segue.destination as? GameSceneViewController
            else { return }
            destination.playerName = playerName
            destination.difficulty = selctedDifficultyControll
        }
    }
    
// MARK: Private Function
    
    private func showAlertController() {
        let alertControl = UIAlertController(title: "Ваше имя: ", message: nil, preferredStyle: .alert)
        let playerNameAction = UIAlertAction(title: "Играть", style: .default, handler: playerNameAlertAction.self)
        let cancelAction = UIAlertAction(title: "Закрыть", style: .cancel)
        alertControl.addTextField { textField in
            textField.placeholder = "Игрок"
        }
        alertControl.addAction(playerNameAction)
        alertControl.addAction(cancelAction)
        alertController = alertControl
        
    }
    
    private func playerNameAlertAction(action: UIAlertAction! = nil) {
        if let textField = alertController.textFields?.first {
            if let text = textField.text {
                playerName = (text != "") ? text : textField.placeholder ?? "Empty"
            }
        }
        performSegue(withIdentifier: segueIdentifier, sender: nil)
        playerName = ""
    }
    


}

