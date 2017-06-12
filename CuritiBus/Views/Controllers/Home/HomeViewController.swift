//
//  HomeViewController.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 11/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class HomeViewController: UIViewController {
    
    let lineInteractor = LineInteractor()
    let ref = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        lineInteractor.getAllLines(success: { (lines) in
//            
//            var json = [String:Any]()
//            for line in lines {
//                guard let code = line.code else {
//                    return
//                }
//                
//                json[code] = line.toJSON()
//            }
//            
////            let json = lines.toJSON()
//            
//            
//            Database.database().goOnline()
//            self.ref.child("urbs").child("lines").setValue(["list": json, "last_updated": Date().timeIntervalSince1970], withCompletionBlock: { (error, ref) in
//                Database.database().goOffline()
//            })
//
//            
//        })
        
//        ref.child("urbs").child("lines").child("list").observe(DataEventType.value, with: { snapshot in
//            print(snapshot.value ?? "")
//            Database.database().goOffline()
//            
//        }, withCancel: { (error) in
//            
//            print(error)
//            Database.database().goOffline()
//        })
        
    }
    
    @IBAction func logout() {
        
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch {
            
        }
        
    }

}
