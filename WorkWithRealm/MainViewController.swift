//
//  ViewController.swift
//  WorkWithRealm
//
//  Created by Egor Syrtcov on 25/09/2019.
//  Copyright © 2019 Egor Syrtcov. All rights reserved.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {

    let cellId = "Cell"
    
    private var tasks = [String]()
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.delegate = self
        tv.dataSource = self
        tv.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        assembel()
        setupLayout()
        
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Tasks"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapButton))
    }
    
    @objc func tapButton() {
        //createAlertController()
        let shoppingList = TaskLists()
        
        let milk = Task()
        milk.name = "Молоко"
        milk.note = "2 литра"
        
        shoppingList.tasks.append(milk)
        
        let bread = Task(value: ["Хлеб","Ржаной",Date(), true])
        let fruits = Task(value: ["name": "Яблоки", "note" : "Пару кг"])
        
        shoppingList.tasks.insert(contentsOf: [bread, fruits], at: 1)
        
        DispatchQueue.main.async {
            StorageManager.saveData([shoppingList])
        }
    }
    
    private func createAlertController() {
        let alert = UIAlertController(title: "Введите ваши данные!", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Новая задача"
        })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            if let newTask = alert.textFields?.first?.text {
                self.tasks.append(newTask)
                self.tableView.reloadData()
            }
        }))
        
        self.present(alert, animated: true)
    }
    
    private func assembel() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task
        return cell
    }
    
    
}
