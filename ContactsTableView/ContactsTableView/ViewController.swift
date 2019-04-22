//
//  ViewController.swift
//  ContactsTableView
//
//  Created by Daisy on 16/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate: class {
    func tossInformation(_ name: String, _ number: String)
}

class ViewController: UIViewController {
    
    weak var delegate: ViewControllerDelegate?
    
    let tableView = UITableView()
    let addNumbersVC = AddNumbersVC()
    var numbers = UserDefaults.standard.object(forKey: "numbers") as? [String] ?? []
    var names = UserDefaults.standard.object(forKey: "names") as? [String] ?? []
    var people = [String:String]()
    var namesort = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

//        UserDefaults.standard.removeObject(forKey: "names")
//        for dict in UserDefaults.standard.dictionaryRepresentation() {
//            print(dict)
//        }
        
        makeDict()
        navigationSet()
        setupTableView()
        addNumbersVC.delegate = self
//                toZero()
    }
    
    
    func makeDict() {
        guard !numbers.isEmpty else {
            return
        }
        for i in 0..<names.count {
        people.updateValue(numbers[i], forKey: names[i])
        }
//        names = []
//        numbers = []
        namesort = people.keys.sorted()
    }
    
    func toZero() {
//        UserDefaults.standard.set([], forKey: "names")
        UserDefaults.standard.removeObject(forKey: "names")
        UserDefaults.standard.removeObject(forKey: "numbers")
        UserDefaults.standard.removeObject(forKey: "")
        
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            UserDefaults.standard.removeObject(forKey: key.description)
            
        }
        
        tableView.reloadData()
    }
    
    func navigationSet() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonAction))
        navigationItem.title = "연락처"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = addButton
    }
    
    func setupTableView() {
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight =  60
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        view.addSubview(tableView)
    }
    
    @objc private func addBarButtonAction() {
        present(addNumbersVC, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = namesort[indexPath.row]
//        cell.detailTextLabel?.text = people[namesort[indexPath.row]]
        return cell
    }
    
//    테이블뷰셀 삭제
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            self.namesort.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//        }
//    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//        navigationController?.pushViewController(detailcontactsVC, animated: true)
        let name = namesort[indexPath.row]
        let number = people[namesort[indexPath.row]] ?? ""
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyBoard.instantiateViewController(withIdentifier: "DetailContactsVC") as? DetailContactsVC ?? nil
        
        present(detailVC!, animated: true)
        self.delegate = detailVC
        delegate?.tossInformation(name, number)
        return indexPath
    
    }
}

extension ViewController: AddnumbersVCDelegate {
    func reload() {
        numbers = UserDefaults.standard.object(forKey: "numbers") as? [String] ?? []
        names = UserDefaults.standard.object(forKey: "names") as? [String] ?? []
        makeDict()
        tableView.reloadData()
    }
}
