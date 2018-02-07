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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeObservers()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Setup
    
    func setupUI() {
        tableView.contentInset.top = UIScreen.main.bounds.height * 0.8
        tableView.decelerationRate = UIScrollViewDecelerationRateFast
    }
    
    func setupObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
    }
    
    func removeObservers() {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.frame.size.height + scrollView.contentOffset.y
        bottomViewHeight.constant = offset
        (childViewControllers.first as? HomeMapViewController)?.scrollViewDidScroll(offset: offset)
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
            let cell: HomeLineSearchCell = tableView.dequeueReusableCell(indexPath)
            cell.delegate = self
            return cell
            
        case 1:
            let cell: HomeLineCell = tableView.dequeueReusableCell(indexPath)
            presenter.configureUserLine(cell, indexPath)
            return cell
            
        default:
            let cell: HomeLineCell = tableView.dequeueReusableCell(indexPath)
            presenter.configureSearchLine(cell, indexPath)
            return cell
        }
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelect(indexPath)
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
    
    func search(_ query: String?) {
        presenter.search(query)
    }
    
    // MARK: - IHomeLinesView
    
    func refreshUserLines(_ lines: [Line]) {
        tableView.reloadSections([1, 2], with: .fade)
    }
    
    func refreshFilter(_ lines: [Line]) {
        tableView.reloadSections([1, 2], with: .fade)
    }
    
    // MARK: - Observers
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        if let keyboardFrame = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect {
            tableView.contentInset.bottom = keyboardFrame.height
        }
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        tableView.contentInset.bottom = 0
    }

}
