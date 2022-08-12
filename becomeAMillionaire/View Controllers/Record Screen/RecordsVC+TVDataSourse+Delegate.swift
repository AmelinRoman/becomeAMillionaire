//
//  RecordsVC + TVDelegate + DataSourse.swift
//  becomeAMillionaire
//
//  Created by Macbook Pro on 11.08.2022.
//

import Foundation
import UIKit

extension RecordsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? { setupHeader() }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { standartHeight * 1.5 }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { standartHeight }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { viewModels.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RecordsTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(from: viewModels[indexPath.row])
        return cell
    }
    
    private func addSubviews(to view: UIView, add subviews: [UIView]) {
        subviews.forEach { view.addSubview($0) }
    }
    
    private func setupLabel(label: UILabel, textAlignment: NSTextAlignment, color: UIColor, fontSize: CGFloat) {
        label.textAlignment = textAlignment
        label.textColor = color
        label.font = label.font.withSize(fontSize)
    }
    
    private func setupHeader() -> UIView {
        let width = standartWidth / 4
        let height = standartHeight * 1.5
        let header = UITableViewHeaderFooterView(frame: CGRect(x: 0, y: 0, width: standartWidth, height: height))
        let nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: height))
        let dateLabel = UILabel(frame: CGRect(x: width, y: 0, width: width, height: height))
        let lifelinesLabel = UILabel(frame: CGRect(x: width * 2, y: 0, width: width, height: height))
        let scoreLabel = UILabel(frame: CGRect(x: width * 3, y: 0, width: width, height: height))
        
        nameLabel.text = "Имя игрока"
        dateLabel.text = "Дата"
        scoreLabel.text = "Рекорд"
        lifelinesLabel.text = "Использовано подсказок"
        lifelinesLabel.numberOfLines = 2
        
        let labels = [nameLabel, dateLabel, lifelinesLabel, scoreLabel]
        labels.forEach { label in setupLabel(label: label, textAlignment: .center, color: .systemBlue, fontSize: 14) }
        addSubviews(to: header, add: labels)
        tableView.sectionHeaderTopPadding = 0
        
        return header
    }   
}
