//
//  CategoryTableViewController.swift
//  APIChallenge
//
//  Created by Gabriel Marinho on 08/12/20.
//

import UIKit

class CategoryTableViewController: UITableViewController {

    var categories: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        CategoryREST.categoryRequest(onComplete: { (category) in
            self.categories = category
            DispatchQueue.main.sync {
                self.tableView.reloadData()
            }
        }) { (error) in
            print(error)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let customCell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
            let nameCategories = categories[indexPath.row];
        customCell.textLabel?.font = UIFont(name: "Avenir Next", size: 17)
        customCell.textLabel?.text = "\(nameCategories.uppercased())"
       
            return customCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories[indexPath.row];
        TypeString.name = category
    }

}

