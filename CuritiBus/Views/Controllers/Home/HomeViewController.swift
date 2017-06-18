//
//  HomeViewController.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 11/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, IHomeView {
    
    @IBOutlet private weak var searchField: UITextField! {
        didSet {
            searchField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 34))
            searchField.leftViewMode = .always
        }
    }
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
            tableView.estimatedRowHeight = 66
            tableView.rowHeight = UITableViewAutomaticDimension
            tableView.contentInset = UIEdgeInsetsMake(0, 0, self.tabBarController!.tabBar.bounds.height, 0)
        }
    }
    
    private var searching = false
    private var result = [Line]()
    
    let disposeBag = DisposeBag()
    
    var presenter: IHomePresenter? {
        didSet {
            presenter?.view = self
        }
    }
    
    //MARK: - UIView Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupRx()
        
        presenter?.loadUserLines()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadSections([0], with: .fade)
    }
    
    //MARK: - Init
    
    func setupNavigationBar() {
        title = "Linhas"
    }
    
    func setupRx() {
        
        // Posição do teclado
        let keyboardWillShow = NotificationCenter.default.rx.notification(NSNotification.Name.UIKeyboardWillShow)
        let keyboardWillHide = NotificationCenter.default.rx.notification(NSNotification.Name.UIKeyboardWillHide)
        
        keyboardWillShow
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { notification in
                
                if let keyboardSize = notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? CGRect, let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval {
                    self.updateScrollViewInset(bottom: keyboardSize.size.height, duration: duration)
                }
                
            }).disposed(by: disposeBag)
        
        keyboardWillHide
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { notification in
                
                if let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval {
                    self.updateScrollViewInset(bottom: self.tabBarController!.tabBar.bounds.height, duration: duration)
                }
                
            }).disposed(by: disposeBag)
        
        searchField.rx.text
        .orEmpty
        .debounce(0.2, scheduler: MainScheduler.instance)
        .distinctUntilChanged()
        .subscribe(onNext: { (text) in
            self.searching = text.characters.count > 0
            self.filter(text)
        }).addDisposableTo(disposeBag)
    }
    
    //MARK: - Actions
    
    func filter(_ text: String) {
        result = UserLinesManager.allLines.filter({ $0.name!.lowercased().contains(text.lowercased()) })
        tableView.reloadSections([0], with: .fade)
    }
    
    func updateScrollViewInset(bottom: CGFloat, duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.tableView.contentInset.bottom = bottom
        }
    }
    
    func hideKeyboard() {
        view.endEditing(true)
    }
    
    //MARK: UITextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    //MARK: - UITableView Datasource
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if searching {
            return 25
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if searching {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ResultHeaderCell") as! ResultHeaderCell
            cell.setSearchText(searchField.text ?? "")
            return cell
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return result.count
        }
        return UserLinesManager.userLines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserLineCell") as! UserLineCell
        
        if searching {
            cell.line = result[indexPath.row]
        } else {
            cell.line = UserLinesManager.userLines[indexPath.row]
        }
        
        return cell
    }
    
    //MARK: - UITableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if searching {
            presenter?.addUserLine(line: result[indexPath.row])
            searching = false
            searchField.text = nil
            hideKeyboard()
            tableView.reloadSections([0], with: .fade)
        } else {
            
            if let line = UserLinesManager.userLines[indexPath.row] as? MetroLine {
                presenter?.getLineStops(line: line)
            }
//            presenter?.deleteUserLine(line: UserLinesManager.userLines[indexPath.row])
//            tableView.reloadSections([0], with: .fade)
            
        }
        
//        presenter?.deleteUserLine(line: UserLinesManager.userLines[indexPath.row])
//        tableView.reloadData()
        
//        presenter?.getLineStops(line: UserLinesManager.userLines[indexPath.row])
    }
    
    //MARK: - IHomeInteractor
    
    func userLinesDidLoad(lines: [Line]) {
        tableView.reloadSections([0], with: .fade)
    }
    
    func userLinesLoadDidFail(error: Error?) {
        
    }

}
