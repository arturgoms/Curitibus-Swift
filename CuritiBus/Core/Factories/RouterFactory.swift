//
//  RouterFactory.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 09/09/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import UIKit

protocol IRouterFactory {
    func createLoginViewRouter() -> ILoginViewRouter
    func createHomeViewRouter() -> IHomeViewRouter
}

struct RouterFactory: IRouterFactory {
    
    let navigationController: UINavigationController?
    
    func createLoginViewRouter() -> ILoginViewRouter {
        return LoginViewRouter(navigationController: navigationController)
    }
    
    func createHomeViewRouter() -> IHomeViewRouter {
        return HomeViewRouter(navigationController: navigationController)
    }
    
}
