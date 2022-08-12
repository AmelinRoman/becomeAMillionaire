//
//  RecordsTableViewCell.swift
//  becomeAMillionaire
//
//  Created by Macbook Pro on 11.08.2022.
//

import UIKit

final class RecordsTableViewCell: UITableViewCell {
    
// MARK: IBOutlet
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var hintsCountLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
// MARK: Function
    func configure(from record: RecordViewModel) {
        self.nameLabel.text = record.modelNameLabel
        self.dateLabel.text = record.modelDateLabel
        self.hintsCountLabel.text = record.modelCountHint
        self.scoreLabel.text = record.modelScore + "₽"
    }
    
}
