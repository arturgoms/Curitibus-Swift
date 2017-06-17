//
//  HomeViewController.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 11/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, IHomeView {
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
            tableView.estimatedRowHeight = 60
            tableView.rowHeight = UITableViewAutomaticDimension
        }
    }
    
    var presenter: IHomePresenter? {
        didSet {
            presenter?.view = self
        }
    }
    
    //MARK: - UIView Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        presenter?.loadUserLines()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        tableView.reloadData()
    }
    
    //MARK: - Init
    
    func setupNavigationBar() {
        title = "Aaaa"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addLine))
    }
    
    //MARK: - Actions
    
    func addLine() {
        self.navigate(.lines)
    }
    
    //MARK: - UITableView Datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserLinesManager.userLines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserLineCell") as! UserLineCell
        cell.line = UserLinesManager.userLines[indexPath.row]
        return cell
    }
    
    //MARK: - UITableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.deleteUserLine(line: UserLinesManager.userLines[indexPath.row])
        tableView.reloadData()
    }
    
    //MARK: - IHomeInteractor
    
    func userLinesDidLoad(lines: [Line]) {
        tableView.reloadData()
    }
    
    func userLinesLoadDidFail(error: Error?) {
        
    }

}
