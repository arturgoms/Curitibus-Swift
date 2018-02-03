//
//  LoginViewController.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 02/02/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit
import TinyConstraints

class LoginViewController: UIViewController, ILoginView {
    
    @IBOutlet private weak var gradientView: UIView!

    var configurator: ILoginConfigurator!
    var presenter: ILoginPresenter!

    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupUI()
    }
    
    func setupUI() {
        let gradient = CAGradientLayer()
        gradient.frame = gradientView.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.9).cgColor]
        gradientView.layer.addSublayer(gradient)
    }
    
    // MARK: - Actions
    
    @IBAction func signInFacebook() {
        presenter.signIn(.facebook)
    }
    
    @IBAction func signInGoogle() {
        presenter.signIn(.google)
    }
    
    @IBAction func signInTwitter() {
        presenter.signIn(.twitter)
    }

}
