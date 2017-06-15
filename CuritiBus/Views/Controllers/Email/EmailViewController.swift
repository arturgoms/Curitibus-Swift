//
//  EmailViewController.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 11/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SkyFloatingLabelTextField

class EmailViewController: UIViewController, UITextFieldDelegate, IEmailView {
    
    @IBOutlet private weak var contentScrollView: UIScrollView!
    @IBOutlet private weak var emailField: SkyFloatingLabelTextFieldWithIcon! {
        didSet {
            emailField.iconFont = AppFont.awesome.size(12)
            emailField.iconText = "\u{f0e0}"
        }
    }
    @IBOutlet private weak var passwordField: SkyFloatingLabelTextFieldWithIcon! {
        didSet {
            passwordField.iconFont = AppFont.awesome.size(14)
            passwordField.iconText = "\u{f023}"
        }
    }
    @IBOutlet private weak var recoverButton: UIButton!
    @IBOutlet private weak var continueButton: UIButton!
    
    let disposeBag = DisposeBag()
    
    var presenter: IEmailPresenter? {
        didSet {
            presenter?.view = self
        }
    }
    
    // MARK: - UIView Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRx()
        
        if presenter?.viewType() == .signIn {
            continueButton.setTitle("BUTTON_SIGNIN".localized, for: .normal)
        } else {
            recoverButton.isHidden = true
            continueButton.setTitle("BUTTON_SIGNUP".localized, for: .normal)
        }
    }
    
    //MARK: Init
    
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
                    self.updateScrollViewInset(bottom: 0, duration: duration)
                }
                
            }).disposed(by: disposeBag)
    }
    
    //MARK: - Actions
    
    @IBAction func hideKeyboard() {
        view.endEditing(true)
    }
    
    func updateScrollViewInset(bottom: CGFloat, duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.contentScrollView.contentInset.bottom = bottom
        }
    }
    
    //MARK: - IB Actions
    
    @IBAction func recoverPassword() {
        
        guard let email = emailField.text, !email.isEmpty else {
            emailField.errorMessage = "ERROR_FILL_EMAIL".localized
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3, execute: {
                self.emailField.errorMessage = nil
            })
            return
        }
        
        presenter?.recover(email: email)
    }
    
    @IBAction func next() {
        
        guard let email = emailField.text, !email.isEmpty else {
            emailField.errorMessage = "ERROR_FILL_EMAIL".localized
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3, execute: {
                self.emailField.errorMessage = nil
            })
            return
        }
        
        guard let password = passwordField.text, !password.isEmpty else {
            passwordField.errorMessage = "ERROR_FILL_PASSWORD".localized
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3, execute: {
                self.passwordField.errorMessage = nil
            })
            return
        }
        
        presenter?.authenticate(email: email, password: password)
    }
    
    @IBAction func back() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
            
        case emailField:
            passwordField.becomeFirstResponder()
            
        case passwordField:
            hideKeyboard()
            
        default:
            break
        }
        
        return true
    }
    
    // MARK: - IEmailView
    
    func userDidAuthenticate() {
        self.navigate(.home(HomePresenter(lineInteractor: LineInteractor())))
    }
    
    func userAuthenticationDidFail(error: Error?) {
        AlertHelper.presentAlert(title: .error, message: error?.localizedDescription ?? "", sender: self)
    }

}
