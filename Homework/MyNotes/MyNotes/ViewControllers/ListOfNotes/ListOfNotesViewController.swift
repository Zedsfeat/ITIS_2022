//
//  ListOfNotesViewController.swift
//  MyNotes
//
//  Created by zedsbook on 01.12.2022.
//

import UIKit

class ListOfNotesViewController: UIViewController {
    
    @IBOutlet weak var counterOfNotes: UILabel!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    @IBAction func createNewNote(_ sender: UIButton) {
        goToEditNote(newNote())
    }
    
    var listOfNotes: [Note] = [] {
        didSet {
            counterOfNotes.text = "\(listOfNotes.count) \(listOfNotes.count == 1 ? "Note" : "Notes")"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        refreshNotes()
    }
    
    private func setupTableView() {
        tableView.contentInset = .init(top: 0, left: 0, bottom: 30, right: 0)
        tableView.separatorInset = .init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    private func indexForNote(id: UUID, in list: [Note]) -> IndexPath {
        let row = Int(list.firstIndex(where: { $0.id == id }) ?? 0)
        return IndexPath(row: row, section: 0)
    }
    
    private func newNote() -> Note {
        let note = Note()
        return note
    }
    
    private func goToEditNote(_ note: Note) {
        let editNotesVC = storyboard?.instantiateViewController(identifier: EditNotesViewController.id) as! EditNotesViewController
        editNotesVC.note = note
        editNotesVC.delegate = self
        navigationController?.pushViewController(editNotesVC, animated: true)
    }
    
    private func fetchNotesFromStorage() {
        listOfNotes = UserDefault.shared.notes
    }
    
    private func deleteNoteFromStorage(_ id: UUID) {
        UserDefault.shared.deleteBy(id: id)
    }
}


// MARK: UITableViewDataSource, UITableViewDelegate
extension ListOfNotesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfNotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListOfNotesTableViewCell.id) as! ListOfNotesTableViewCell
        cell.setup(note: listOfNotes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToEditNote(listOfNotes[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteNote(with: listOfNotes[indexPath.row].id)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}


//MARK: - ListNotesDelegate
extension ListOfNotesViewController: ListNotesDelegate {    
    func refreshNotes() {
        fetchNotesFromStorage()
        listOfNotes = listOfNotes.sorted { $0.date > $1.date }
        tableView.reloadData()
    }
    
    func deleteNote(with id: UUID) {
        deleteNoteFromStorage(id)
        let indexPath = indexForNote(id: id, in: listOfNotes)
        listOfNotes.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .none)
    }
}
