//
//  LoginViewController.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 08/09/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import UIKit
import FacebookLogin
import AuthenticationServices

class LoginViewController: UIViewController, ILoginView {
    
    var configurator: ILoginConfigurator! = LoginConfigurator()
    var presenter: ILoginPresenter!
    
    @IBOutlet weak var loginProviderStackView: UIStackView!
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(self)
        
        setupProviderLoginView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.checkAuth()
    }
    
    // MARK: - ILoginView
    
    func loginFailure(error: Error) {
        
    }
    
    // MARK: - Actions
    
    private func setupProviderLoginView() {
        if #available(iOS 13.0, *) {
            let authorizationButton = ASAuthorizationAppleIDButton(type: .default, style: .black)
            authorizationButton.addTarget(self, action: #selector(loginWithApple), for: .touchUpInside)
            self.loginProviderStackView.addArrangedSubview(authorizationButton)
        }
        
        let fbLoginButton = FBLoginButton(frame: .zero, permissions: [.email, .publicProfile])
        fbLoginButton.delegate = presenter as? LoginButtonDelegate
        loginProviderStackView.addArrangedSubview(fbLoginButton)
        fbLoginButton.constraints.first(where: { $0.constant == 28 })?.constant = 40
    }
    
    // MARK: - Actions
    
    @objc
    private func loginWithApple() {
        if #available(iOS 13.0, *) {
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            let request = appleIDProvider.createRequest()
            request.requestedScopes = [.fullName, .email]

            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.delegate = presenter as? ASAuthorizationControllerDelegate
            authorizationController.presentationContextProvider = self
            authorizationController.performRequests()
        }
    }
    
}

@available(iOS 13.0, *)
extension LoginViewController: ASAuthorizationControllerPresentationContextProviding {

    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }

}
