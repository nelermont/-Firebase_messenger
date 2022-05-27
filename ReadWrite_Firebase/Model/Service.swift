//
//  Service.swift
//  ReadWrite_Firebase
//
//  Created by Дмитрий Подольский on 27.05.2022.
//

import UIKit
import Firebase
import FirebaseAuth

class Service {
    static let shared = Service()
    
    init() {}
    
    //
    
    func createNewUser(_ data: LoginField, complition: @escaping (ResponseCode)->()) {
        Auth.auth().createUser(withEmail: data.email, password: data.password) { [weak self] result, err in
            if err == nil {
                if result != nil {
//                    let userId = result?.user.uid
                
                    complition(ResponseCode(code: 1))
                }
            } else {
                complition(ResponseCode(code: 0))
                
            }
        }
    
    }
    func confrimEmail() {
        Auth.auth().currentUser?.sendEmailVerification(completion: { err in
            if err != nil {
                print(err!.localizedDescription)
            }
        })
    }
}

