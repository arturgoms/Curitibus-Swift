//
//  LoginViewController.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 08/09/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import UIKit
import FacebookLogin
//import AuthenticationServices

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
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        performExistingAccountSetupFlows()
//    }
    
    func setupProviderLoginView() {
//        if #available(iOS 13.0, *) {
//            let authorizationButton = ASAuthorizationAppleIDButton()
//            authorizationButton.addTarget(self, action: #selector(loginWithApple), for: .touchUpInside)
//            self.loginProviderStackView.addArrangedSubview(authorizationButton)
//        }
        
        let fbLoginButton = FBLoginButton(frame: .zero, permissions: [.email, .publicProfile])
        fbLoginButton.delegate = presenter
        loginProviderStackView.addArrangedSubview(fbLoginButton)
        fbLoginButton.constraints.first(where: { $0.constant == 28 })?.constant = 40
    }
    
//    func performExistingAccountSetupFlows() {
//        if #available(iOS 13.0, *) {
//            // Prepare requests for both Apple ID and password providers.
//            let requests = [ASAuthorizationAppleIDProvider().createRequest(),
//                            ASAuthorizationPasswordProvider().createRequest()]
//
//            // Create an authorization controller with the given requests.
//            let authorizationController = ASAuthorizationController(authorizationRequests: requests)
//            authorizationController.delegate = self
//            authorizationController.presentationContextProvider = self
//            authorizationController.performRequests()
//        }
//    }
    
    // MARK: - Actions
    
//    @IBAction private func loginWithApple() {
//        if #available(iOS 13.0, *) {
//            let appleIDProvider = ASAuthorizationAppleIDProvider()
//            let request = appleIDProvider.createRequest()
//            request.requestedScopes = [.fullName, .email]
//
//            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
//            authorizationController.delegate = presenter
//            authorizationController.presentationContextProvider = self
//            authorizationController.performRequests()
//        }
//    }
    
    @IBAction private func loginWithFacebook() {
        presenter.signInWith(.facebook)
    }
    
}

//@available(iOS 13.0, *)
//extension LoginViewController: ASAuthorizationControllerPresentationContextProviding {
//
//    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
//        return self.view.window!
//    }
//
//}
