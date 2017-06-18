//
//  RegisterViewController.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 11/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, IRegisterView {
    
    var presenter: IRegisterPresenter? {
        didSet {
            presenter?.view = self
        }
    }
    
    //MARK: - UIView Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBActions
    
    @IBAction func facebookSignIn() {
        presenter?.facebookSignIn()
    }
    
    @IBAction func googleSignIn() {
        presenter?.googleSignIn()
    }
    
    @IBAction func emailSignUp() {
        self.navigate(.email(EmailSignUpPresenter()))
    }
    
    @IBAction func emailSignIn() {
        self.navigate(.email(EmailSignInPresenter()))
    }
    
    //MARK: - IRegisterView
    
    func userDidLogin() {
        self.navigate(.home(HomePresenter(lineInteractor: LineInteractor(), stopInteractor: StopInteractor(), shapeInteractor: ShapeInteractor()), MapPresenter()))
    }
    
    func userLoginDidFail(error: Error?) {
        AlertHelper.presentAlert(title: .error, message: error?.localizedDescription ?? "", sender: self)
    }

}
