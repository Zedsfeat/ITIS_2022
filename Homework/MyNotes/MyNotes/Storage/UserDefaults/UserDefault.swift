//
//  UserDefault.swift
//  MyNotes
//
//  Created by zedsbook on 02.12.2022.
//

import Foundation

struct UserDefault {
    let defaults = UserDefaults.standard

    static var shared = UserDefault()
    
    var notes: [Note] {

        get {
            if let data = defaults.value(forKey: "notes") as? Data {
                return try! PropertyListDecoder().decode([Note].self, from: data)
            } else {
                return [Note]()
            }
        }

        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: "notes")
            }
        }
    }
    
    mutating func containsBy(id: UUID) -> Bool {
        var flag = false
        var countFlag = 0
        notes.forEach { note in
            if note.id == id {
                countFlag += 1
                if countFlag > 0 {
                    flag = true
                    return
                }
            }
        }
        return flag
    }

    mutating func saveBy(id: UUID, text: String, date: Date) -> Void {
        let note = Note(id: id, text: text, date: date)
        notes.insert(note, at: 0)
    }

    mutating func deleteBy(id: UUID) -> Void {
        for index in 0..<notes.count {
            if notes[index].id == id {
                notes.remove(at: index)
                return
            }
        }
    }
}
