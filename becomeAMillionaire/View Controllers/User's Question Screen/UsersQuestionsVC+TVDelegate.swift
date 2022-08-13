//
//  UsersQuestionsVC+TVDelegate.swift
//  becomeAMillionaire
//
//  Created by Macbook Pro on 12.08.2022.
//
import UIKit

extension UsersQuestionsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Game.shared.userQuestion.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}
