//
//  AddQuestionVC+TVDataSourse.swift
//  becomeAMillionaire
//
//  Created by Macbook Pro on 12.08.2022.
//

import UIKit

extension AddQuestionViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberQuestion
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AddQuestionTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.questionLabel.text = "Вопрос №\(indexPath.row + 1)"
        return cell
    }
}
