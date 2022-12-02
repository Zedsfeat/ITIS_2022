//
//  EditNotesViewController.swift
//  MyNotes
//
//  Created by zedsbook on 01.12.2022.
//

import UIKit

class EditNotesViewController: UIViewController {
    
    static let id = "EditNotesViewControllerID"
    
    var note: Note!
    weak var delegate: ListNotesDelegate?

    @IBOutlet weak var noteTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextView()
        setupNavigationBar()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func setupNavigationBar() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save))
        navigationItem.rightBarButtonItem = saveButton
    }

    func setupTextView() {
        noteTextView.text = note.text
        noteTextView.becomeFirstResponder()
        
        noteTextView.tintColor = .orange
        noteTextView.font = UIFont.systemFont(ofSize: 30)
        noteTextView.layer.cornerRadius = 20
        noteTextView.layer.borderWidth = 1
        noteTextView.layer.borderColor = UIColor.systemGray3.cgColor
        noteTextView.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func updateNote() {
        if UserDefault.shared.containsBy(id: note.id) {
            deleteNote()
        }
        UserDefault.shared.saveBy(id: note.id, text: noteTextView.text, date: note.date)
        delegate?.refreshNotes()
    }
    
    func deleteNote() {
        UserDefault.shared.deleteBy(id: note.id)
        delegate?.deleteNote(with: note.id)
    }
    
    @objc
    func save() {
        note.text = noteTextView.text
        if !note.title.isEmpty {
            updateNote()
        }
        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
}
