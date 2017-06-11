//
//  UIDevice-Hardware.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 27/04/17.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class Storyboard {
    
    class func instantiate<VC: UIViewController>(_ viewController: VC.Type, parameters: AnyObject? = nil) -> VC {
        
        let identifier = String(describing: viewController)
        guard let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: identifier) as? VC else {
            fatalError("Erro ao instanciar view \(identifier)")
        }
        
        return vc
    }
    
    class func currentViewController() -> UIViewController? {
        return (UIApplication.shared.keyWindow!.rootViewController as? UINavigationController)?.viewControllers.first
    }
    
    class func currentWindow() -> UIWindow {
        return UIApplication.shared.keyWindow!
    }
    
}

extension UIViewController {
    
    var currentNavigationController: UINavigationController {
        return UIApplication.shared.keyWindow!.rootViewController as! UINavigationController
    }
    
    private func performTransition(flips: Bool, action: () -> Void) {
        if flips {
            UIView.beginAnimations("animation", context: nil)
            action()
            UIView.setAnimationDuration(0.5)
            UIView.setAnimationTransition(.flipFromLeft, for: self.navigationController!.view, cache: false)
            UIView.commitAnimations()
        } else {
            action()
        }
    }
    
    func push(flips: Bool = false) {
        performTransition(flips: flips) {
            currentNavigationController.pushViewController(self, animated: true)
        }
    }
    
    func setRoot(flips: Bool = false) {
        performTransition(flips: flips) {
            currentNavigationController.setViewControllers([self], animated: true)
        }
    }
    
    func modal() {
        currentNavigationController.present(self, animated: true, completion: nil)
    }
    
    func onTop(flips: Bool = false) {
        performTransition(flips: flips) {
            currentNavigationController.view.addSubview(self.view)
        }
    }
    
    func replaceLast(flips: Bool = false) {
        performTransition(flips: flips) {
            var viewControllers = currentNavigationController.viewControllers
            
            if let lastView = viewControllers.last, let index = viewControllers.index(of: lastView) {
                viewControllers[index] = self
                currentNavigationController.viewControllers = viewControllers
            } else {
                currentNavigationController.pushViewController(self, animated: true)
            }
        }
    }
    
}
