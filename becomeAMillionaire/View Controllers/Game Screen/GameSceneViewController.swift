//
//  GameSceneViewController.swift
//  becomeAMillionaire
//
//  Created by Macbook Pro on 08.08.2022.
//

import UIKit

protocol GameSceneDelegate: AnyObject {
    func endGame(dificulty: Difficulty, playerName: String, playerScore: Int, callFriend: Bool, fiftyFifty: Bool, hallHelp: Bool)
}

final class GameSceneViewController: UIViewController {
    
// MARK: IBOutlets
    @IBOutlet weak var indicatorScoreConstraint: NSLayoutConstraint! {
        didSet {
            self.progressIndicatorPosition = self.indicatorScoreConstraint.constant
        }
    }
    @IBOutlet weak var indicatorScore: UIImageView!
    @IBOutlet weak var scoreTable: UIImageView!
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var takeCash: UIButton!
    @IBOutlet weak var hallHelp: UIButton!
    @IBOutlet weak var callFriend: UIButton!
    @IBOutlet weak var fiftyFifty: UIButton!
    @IBOutlet weak var answerA: UIButton!
    @IBOutlet weak var answerB: UIButton!
    @IBOutlet weak var answerC: UIButton!
    @IBOutlet weak var answerD: UIButton!
    @IBOutlet weak var exitMenuButton: UIBarButtonItem!
    
    
// MARK: IBAction
    // обработка нажатия на ответы
    @IBAction func pressingTheAnswerButton(sender: UIButton!) {
        hideQuestion()
        ringhtAnswer == sender.tag ? сlickingOnTheCorrectAnswer() : theGameIsLost()
    }
    // обработка нажатия на подсказки
    @IBAction func hintButtonClick(sender: UIButton!) {
        switch sender {
        case fiftyFifty: hintFiftyFifty()
        case callFriend: hintCallFriend()
        case hallHelp: hintHallHelp()
        case takeCash: pressTakeCash()
        default: break
        }
    }
// MARK: Properties
    weak var delegate: GameSceneDelegate?
    var playerName: String = ""
    var gameSession = GameSession()
    var difficulty: Difficulty = .hard {
        didSet {
            gameSession.difficulty = difficulty
        }
    }
// MARK: Private Properties
    private var buttonAnswerCollection: [UIButton] { [answerA, answerB, answerC, answerD]}
    private var buttonHintsCollection: [UIButton] {[callFriend, hallHelp, fiftyFifty]}
    private var progressIndicatorPosition = CGFloat()
    private var question = [Question]()
    private var numberQuestion = Observable<Int>(0)
    private var score: Int = 0
    private var wrongAnswer = [Int]()
    private var ringhtAnswer = Int() {
        
        didSet{
            wrongAnswer = [1,2,3,4].filter({ $0 != ringhtAnswer })
        }
    }
    private var scoreValue = [0:0, 1:100, 2:200, 3:300, 4:500, 5:1000, 6:2000, 7:4000, 8:8000, 9:16000, 10:32000, 11:64000, 12:125000, 13:250000, 14:500000, 15:1000000]
    private var difficultySettingFacade: DifficultyFacade {
        DifficultyFacade(difficulty: difficulty)
    }
 
    override func viewDidLoad() {
        initialSetupGame()
    }
 // MARK: Private Function Game
    private func initialSetupGame() {
        delegate = Game.shared
        Game.shared.gameSession = gameSession
        numberQuestion.addObserver(self, options: [.new, .initial])
        {[weak self] (number, _) in
            if number < 15 {self?.title = "Question #\(number + 1)" }
            self?.gameSession.numberQuestion = number
            guard let score = self?.scoreValue[number] else { return }
            self?.score = score
            print(score)
        }
        buttonAnswerCollection.forEach { $0.titleLabel?.textAlignment = .center}
        question = difficultySettingFacade.settingpGame()
        getQuestion()
    }
    
    private func getQuestion(action: UIAlertAction! = nil) {
        buttonAnswerCollection.forEach { $0.isEnabled = true}
        if numberQuestion.value > 0 { animateProgresIndicator()
            print(numberQuestion.value)
        }
        let currentQuestion = question[numberQuestion.value]
        labelQuestion.text = currentQuestion.question
        answerA.setTitle("A) " + currentQuestion.answers[0], for: .normal)
        answerB.setTitle("B) " + currentQuestion.answers[1], for: .normal)
        answerC.setTitle("C) " + currentQuestion.answers[2], for: .normal)
        answerD.setTitle("D) " + currentQuestion.answers[3], for: .normal)
        ringhtAnswer = currentQuestion.correctNumberAnswer
    }
    
    private func animateProgresIndicator() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
            self.indicatorScoreConstraint.constant -=
            self.scoreTable.frame.height / 15 + 0.4
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    private func hideQuestion() {
        labelQuestion.text = ""
        buttonAnswerCollection.forEach { $0.setTitle("", for: .normal)}
    }
    
    private func сlickingOnTheCorrectAnswer() {
        numberQuestion.value += 1
        if numberQuestion.value < 15 {
            let alertController = UIAlertController(title: "Правильный ответ!", message: "Твоя текущая сумма выйгрыша: \(score)₽", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Продолжить", style: .default, handler: getQuestion))
            present(alertController, animated: true)
        } else {
            
        }
    }
    
    private func winningTheGame(action: UIAlertAction! = nil) {
        hideQuestion()
        let alertController = UIAlertController(title: "Поздравляем!", message: "Вы выйграли: \(score)₽!", preferredStyle: .alert)
        if numberQuestion.value == 15 {
            alertController.addAction(UIAlertAction(title: "Начать новую игру", style: .default, handler: restartGame))
            alertController.addAction(UIAlertAction(title: "Выйти в гланое меню", style: .default, handler: exitToMenuViewController))
            present(alertController, animated: true)
            delegate?.endGame(dificulty: difficulty, playerName: playerName, playerScore: score, callFriend: gameSession.callFriend, fiftyFifty: gameSession.fiftyFifty, hallHelp: gameSession.hallHelp)
        }
    }
    
    private func theGameIsLost() {
        switch score {
        case 0..<1000: score = 0
        case 1000..<32000: score = 1000
        case 32000..<1000000: score = 32000
        default: break
        }
        let alertController = UIAlertController(title: "Не правильный ответ!", message: "Вы проиграли! Ваша сгоревшая сумма: \(score)₽", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Начать новую игру", style: .default, handler: restartGame))
        alertController.addAction(UIAlertAction(title: "Выйти в главное меню", style: .default, handler: exitToMenuViewController))
        present(alertController, animated: true)
        delegate?.endGame(dificulty: difficulty, playerName: playerName, playerScore: score, callFriend: gameSession.callFriend, fiftyFifty: gameSession.fiftyFifty, hallHelp: gameSession.hallHelp)
    }
    
    private func restartGame(action: UIAlertAction! = nil) {
        numberQuestion.value = 0
        question = difficultySettingFacade.settingpGame()
        buttonHintsCollection.forEach { $0.isEnabled = true }
        gameSession.fiftyFifty = false
        gameSession.hallHelp = false
        gameSession.callFriend = false
        UIView.animate(withDuration: 1, delay: 0.0, options: .curveEaseInOut) {
            self.indicatorScoreConstraint.constant = self.progressIndicatorPosition
        } completion: { _ in
            self.getQuestion()
        }
    }
    
    private func exitToMenuViewController(action: UIAlertAction! = nil) {
        navigationController?.popViewController(animated: true)
        Game.shared.gameSession = nil
    }
// MARK: Private Function Hints
    
    private func hintFiftyFifty() {
        fiftyFifty.isEnabled = false
        gameSession.fiftyFifty = true
        var button = buttonAnswerCollection
        button.remove(at: ringhtAnswer)
        let removeIndex = Int.random(in: 0...2)
        wrongAnswer = [wrongAnswer[removeIndex]]
        button.remove(at: removeIndex)
        button.forEach({$0.isEnabled = false})
    }
    
    private func hintCallFriend() {
        callFriend.isEnabled = false
        gameSession.callFriend = true
        
        let randomNumber = Int.random(in: 1...4)
        var friendsAnswer = Int()
        var isSure = false
        
        switch randomNumber {
        case 1,4: isSure = true; friendsAnswer = ringhtAnswer
        case 2,3:
            isSure = false
            if let wrongAnswer = wrongAnswer.randomElement() {
                friendsAnswer = wrongAnswer }
        default: friendsAnswer = 0
        }
        
        var message: String {
            switch friendsAnswer {
            case 1: return isSure ? "Я уверен что это ответ А" : "Я не уверен но думаю что это ответ А"
            case 2: return isSure ? "Я уверен что это ответ В" : "Я не уверен но думаю что это ответ B"
            case 3: return isSure ? "Я уверен что это ответ С" : "Я не уверен но думаю что это ответ C"
            case 4: return isSure ? "Я уверен что это ответ D" : "Я не уверен но думаю что это ответ D"
            default: return "Прости я не знаю"
            }
        }
        
        let alertController = UIAlertController(title: "Привет Дружище!", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Отвечать", style: .default, handler: nil))
        present(alertController, animated: true)
    }
    
    private func hintHallHelp() {
        hallHelp.isEnabled = false
        gameSession.hallHelp = true
        
        let randomInt = Int.random(in: 55...99)
        var result = [Int: Int]()
        result[ringhtAnswer] = randomInt
        
        if wrongAnswer.count == 3 {
            let voteWrong1 = Int.random(in: 0...100 - randomInt)
            let voteWrong2 = Int.random(in: 0...100 - randomInt - voteWrong1)
            let voteWrong3 = 100 - randomInt - voteWrong1 - voteWrong2
            result[wrongAnswer[0]] = voteWrong1
            result[wrongAnswer[1]] = voteWrong2
            result[wrongAnswer[2]] = voteWrong3
        } else { result[wrongAnswer[0]] = 100 - randomInt }
        
        let alertController = UIAlertController(title: "Результаты помощи зала:", message: "", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Узнать результат", style: .default, handler: nil))
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.left
        let messageText = NSMutableAttributedString(
            string: """
                    
                                        A:  \(result[1] ?? 0)%
                                        B:  \(result[2] ?? 0)%
                                        C:  \(result[3] ?? 0)%
                                        D:  \(result[4] ?? 0)%
                    
                    """,
            attributes: [ NSAttributedString.Key.paragraphStyle: paragraphStyle ])
        alertController.setValue(messageText, forKey: "attributedMessage")
        present(alertController, animated: true)
    }
    
    private func pressTakeCash() {
        let alertController = UIAlertController(title: "Вы уверены что хотите закончить игру?", message: "Ваша текущая сумма: \(score)₽", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Да, уверен", style: .default, handler: winningTheGame))
        alertController.addAction(UIAlertAction(title: "Нет", style: .cancel, handler:  nil))
    }
}
