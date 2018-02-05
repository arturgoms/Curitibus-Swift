//
//  HomeLinesTableViewController.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 04/02/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit
import Firebase

class HomeLinesTableViewController: UITableViewController, IHomeLinesView, LineSearchDelegate {
    
    var configurator: IHomeLinesConfigurator! = HomeLinesConfigurator()
    var presenter: IHomeLinesPresenter!
    
    private var headerView: UIView!
    
    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(self)
        
        setupUI()
        
        presenter.listLines()
        presenter.listUserLines()
    }
    
    func setupUI() {
        headerView = tableView.tableHeaderView
        tableView.contentInset = UIEdgeInsets(top: -20, left: 0, bottom: 0, right: 0)
        tableView.tableHeaderView?.frame.size.height = UIScreen.main.bounds.height
        tableView.decelerationRate = UIScrollViewDecelerationRateFast
    }
    
    override func viewSafeAreaInsetsDidChange() {
        tableView.contentInset = UIEdgeInsets(top: -view.safeAreaInsets.top, left: 0, bottom: 0, right: 0)
    }
    
    // MARK: - UIScrollViewDelegate
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let homeMap = childViewControllers.first as? HomeMapViewController {
            homeMap.scrollViewDidScroll(scrollView: scrollView)
        }
        
        if scrollView.contentOffset.y < 56 {
            tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .bottom, animated: false)
        }
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return presenter.numberOfUserLines()
        default:
            return presenter.numberOfSearchLines()
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
        tableView.tableHeaderView = nil
        presenter.search("")
    }
    
    func collapseSearch() {
        tableView.tableHeaderView = headerView
        tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .bottom, animated: false)
        presenter.search(nil)
    }
    
    // MARK: - IHomeLinesView
    
    func refreshLines(_ lines: [Line]) {
        tableView.reloadData()
        
        let offset = 56 + lines.count * 44
        self.tableView.setContentOffset(CGPoint(x: 0, y: offset), animated: true)
    }
    
    func refreshFilter(_ lines: [Line]) {
        
    }

}
