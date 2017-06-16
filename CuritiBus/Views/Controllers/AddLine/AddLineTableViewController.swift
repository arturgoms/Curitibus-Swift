//
//  AddLineTableViewController.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 14/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class AddLineTableViewController: UITableViewController {
    
    //MARK: - UIView Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
    }
    
    //MARK: - Init
    
    func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func setupNavigationBar() {
        title = "Aaaa"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissView))
    }
    
    //MARK: - Actions
    
    func dismissView() {
        dismiss(animated: true, completion: nil)
    }

    //MARK: - UITableView Datasource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserLinesManager.allLines.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddLineCell", for: indexPath) as! AddLineCell
        cell.line = UserLinesManager.allLines[indexPath.row]
        return cell
    }

    //MARK: - UITableView Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let line = UserLinesManager.allLines[indexPath.row]
        LineInteractor().addUserLine(line: line)
        dismissView()
    }
    
}
