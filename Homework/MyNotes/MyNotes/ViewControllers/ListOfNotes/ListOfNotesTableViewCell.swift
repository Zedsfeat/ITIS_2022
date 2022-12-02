//
//  ListOfNotesTableViewCell.swift
//  MyNotes
//
//  Created by zedsbook on 01.12.2022.
//

import UIKit

class ListOfNotesTableViewCell: UITableViewCell {
    
    static let id = "ListOfNotesTableViewCellID"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func setup(note: Note) {
        titleLabel.text = note.text
        dateLabel.text = note.dateFormatted
    }
}
