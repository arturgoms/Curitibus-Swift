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
    
    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(self)
        
        setupUI()
        presenter.listUserLines()
    }
    
    func setupUI() {
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
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return presenter.numberOfLines()
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell: HomeLineSearchCell! = tableView.dequeueReusableCell(withIdentifier: "HomeLineSearchCell", for: indexPath) as? HomeLineSearchCell
            cell.delegate = self
            return cell
            
        default:
            return tableView.dequeueReusableCell(withIdentifier: "HomeLineCell", for: indexPath)
        }
    }
    
    // MARK: - LineSearchDelegate
    
    func expandSearch() {
//        tableView.contentInset.bottom = 300
//        tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
    }
    
    func collapseSearch() {
//        tableView.contentInset.bottom = 0
    }
    
    // MARK: - IHomeLinesView
    
    func refreshLines(_ lines: [Line]) {
        tableView.reloadData()
        
        let offset = 56 + lines.count * 44
        self.tableView.setContentOffset(CGPoint(x: 0, y: offset), animated: true)
    }

}
