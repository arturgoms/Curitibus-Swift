//
//  FirebaseUserLinesGateway.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 04/02/2018.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import FirebaseDatabase

class FirebaseUserLinesGateway: UserLinesGateway {
    
    func listUserLines(uid: String, completion: @escaping (Result<[Line]>) -> Void) {
        
        let ref = Database.database().reference().child("users").child(uid).child("lines")
        ref.observeSingleEvent(of: .value) { snapshot in

            if snapshot.value == nil {
                completion(.success([]))
                
            } else if let value = snapshot.value as? [String: Any] {
                
                var result = [Line]()
                value.keys.forEach({ key in
                    do {
                        let data = try JSONSerialization.data(withJSONObject: value[key]!, options: [])
                        let line = try JSONDecoder().decode(Line.self, from: data)
                        result.append(line)
                    } catch { }
                })
                
                completion(.success(result))
                
            } else {
                //TODO: failure
            }
            
        }
        
    }
    
    func storeUserLine(uid: String, line: Line, completion: @escaping (Result<Void>) -> Void) {
        
        let ref = Database.database().reference().child("users").child(uid).child("lines").childByAutoId()
        ref.setValue(line.encodeToJson()) { error, _ in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
        
    }
    
}
