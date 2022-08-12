//
//  AddQuestionTableViewCell.swift
//  becomeAMillionaire
//
//  Created by Macbook Pro on 12.08.2022.
//

import UIKit

class AddQuestionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerALabel: UILabel!
    @IBOutlet weak var answerATextField: UITextField!
    @IBOutlet weak var answerBLabel: UILabel!
    @IBOutlet weak var answerBTextField: UITextField!
    @IBOutlet weak var answerCLabel: UILabel!
    @IBOutlet weak var answerCTextField: UITextField!
    @IBOutlet weak var answerDLabel: UILabel!
    @IBOutlet weak var answerDTextField: UITextField!
    @IBOutlet weak var correctAnswerLabel: UILabel!
    @IBOutlet weak var correctAnswerController: UISegmentedControl!
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var difficultySegmentController: UISegmentedControl!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
