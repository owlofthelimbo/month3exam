//
//  ViewController.swift
//  exam
//
//  Created by Александр Калашников on 1/8/22.
//

import UIKit

class ViewController: UIViewController {

    private lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.delegate = self
        return view
    }()
    
    private lazy var tableViewChars: UITableView = {
        let view = UITableView()
        view.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.dataSource = self
        return view
    }()
    
    private lazy var tableViewNames: UITableView = {
        let view = UITableView()
        view.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.dataSource = self
        return view
    }()
    
    let arrayChars = ["А", "Б", "Г", "В"]
    let arrayNames = ["Александр", "Антон", "Анатолий", "Абрам", "Али", "Бахрам", "Бенджамин", "Богдан", "Булат", "Бронислав", "Гавриил", "Генрих", "Густав", "Георгий", "Гордей", "Вит", "Всеволод", "Владлен", "Вильгельм", "Вальдемар"]
    var dataChars: [String]? = []
    var dataNames: [String]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        layout()
        dataChars = arrayChars
        dataNames = arrayNames
    }
    
    func layout() {
        view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        searchBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        searchBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        
        view.addSubview(tableViewChars)
        tableViewChars.translatesAutoresizingMaskIntoConstraints = false
        tableViewChars.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10).isActive = true
        tableViewChars.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        tableViewChars.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        tableViewChars.heightAnchor.constraint(equalToConstant: 200).isActive = true
        tableViewChars.layer.borderWidth = 1
        tableViewChars.layer.cornerRadius = 15
        
        view.addSubview(tableViewNames)
        tableViewNames.translatesAutoresizingMaskIntoConstraints = false
        tableViewNames.topAnchor.constraint(equalTo: tableViewChars.bottomAnchor, constant: 10).isActive = true
        tableViewNames.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        tableViewNames.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        tableViewNames.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
        tableViewNames.layer.borderWidth = 1
        tableViewNames.layer.cornerRadius = 15
    }


}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        dataNames = []
        dataChars = []
        
        var firstChar = ""

        for i in searchText {
            firstChar = String(i)
            break
        }
        
        if searchText == "" {
            dataChars = arrayChars
            dataNames = arrayNames
        }
        
        for char in arrayChars {
            if char.contains(firstChar) {
                dataChars?.append(firstChar)
            }
        }
        
        for name in arrayNames {
            if name.contains(searchText) {
                dataNames?.append(name)
            }
        }
        
        self.tableViewChars.reloadData()
        self.tableViewNames.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableViewChars {
            return dataChars!.count
        } else {
            return dataNames!.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if tableView == tableViewChars {
            cell.textLabel?.text = dataChars![indexPath.row]
        } else {
            cell.textLabel?.text = dataNames![indexPath.row]
        }
        
        return cell
    }
    
    
}

