//
//  Note.swift
//  MyNotes
//
//  Created by zedsbook on 01.12.2022.
//

import Foundation

class Note: Codable {
    var id: UUID = UUID()
    var text: String = ""
    var date: Date = Date()
    
    init(id: UUID = UUID(), text: String = "", date: Date = Date()) {
        self.id = id
        self.text = text
        self.date = date
    }
    
    var title: String {
        return text.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: .newlines).first ?? ""
    }
    
    var dateFormatted: String {
        return "\(date.format())"
    }
}

