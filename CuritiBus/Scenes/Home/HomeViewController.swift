//
//  HomeViewController.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 03/02/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, IHomeView, UITableViewDataSource, UITableViewDelegate, LineSearchDelegate {
    
    var configurator: IHomeConfigurator!
    var presenter: IHomePresenter!
    
    @IBOutlet weak var tableView: HollowTableView!
    @IBOutlet weak var bottomViewHeight: NSLayoutConstraint!
    
    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(self)
        
        setupUI()
        
        presenter.listUserLines()
        presenter.listLines()
    }
    
    func setupUI() {
        tableView.contentInset.top = UIScreen.main.bounds.height * 0.8
        tableView.decelerationRate = UIScrollViewDecelerationRateFast
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        bottomViewHeight.constant = scrollView.frame.size.height + scrollView.contentOffset.y
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return presenter.numberOfUserLines()
        default:
            return presenter.numberOfSearchLines()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell: HomeLineSearchCell! = tableView.dequeueReusableCell(withIdentifier: "HomeLineSearchCell", for: indexPath) as? HomeLineSearchCell
            cell.delegate = self
            return cell
            
        case 1:
            return tableView.dequeueReusableCell(withIdentifier: "HomeLineCell", for: indexPath)
            
        default:
            return tableView.dequeueReusableCell(withIdentifier: "HomeLineCell", for: indexPath)
        }
    }
    
    // MARK: - LineSearchDelegate
    
    func expandSearch() {
        tableView.contentInset.top = 0
        presenter.search("")
    }
    
    func collapseSearch() {
        tableView.contentInset.top = UIScreen.main.bounds.height * 0.8
        presenter.search(nil)
    }
    
    // MARK: - IHomeLinesView
    
    func refreshUserLines(_ lines: [Line]) {
        tableView.reloadSections([1, 2], with: .fade)
    }
    
    func refreshFilter(_ lines: [Line]) {
        tableView.reloadSections([1, 2], with: .fade)
    }

}
