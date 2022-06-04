//
//  Service.swift
//  ReadWrite_Firebase
//
//  Created by Дмитрий Подольский on 27.05.2022.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class Service {
    static let shared = Service()
    
    init() {}
    
    //
    
    func createNewUser(_ data: LoginField, complition: @escaping (ResponseCode)->()) {
        Auth.auth().createUser(withEmail: data.email, password: data.password) {  result, err in
            if err == nil {
                if result != nil {
                    let userId = result?.user.uid
                    let email = data.email
                    let data: [String: Any] = ["email":email]
                    Firestore.firestore().collection("users").document(userId!).setData(data)
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
    
    
    func authInApp(_ data: LoginField, complection: @escaping (AuthResponce) -> ()) {
        Auth.auth().signIn(withEmail: data.email, password: data.password) { result, err in
            if err != nil {
                complection(.error)
            } else {
                if let result = result {
                    if result.user.isEmailVerified {
                        complection(.success)
                    } else {
                        self.confrimEmail()
                        complection(.noVerify)
                    }
                }
            }
        }
    }
    func getUserStatus() {
        // is isset
        // auth?
    }
    
    
    func getAllUseres(completion: @escaping ([String]) -> ()) {
        Firestore.firestore().collection("users").getDocuments { snap, err in
            if err == nil {
                var emailList = [String]()
                if let docs = snap?.documents {
                    for doc in docs {
                        let data = doc.data()
                        let email = data["email"] as! String
                        emailList.append(email)
                    }
                }
                completion(emailList)
            }
        }
    }
    
    
    
    
    //MARK: -- Messanger
    
    func sendMessage(otherId: String?, convId: String?, message: Message, text: String, completion: @escaping (Bool)->()) {
        if convId == nil {
            //создаем новую переписку
        } else {
            let msg: [String:Any] = [
                "date": Date(),
                "sender": message.sender.senderId,
                "text": text
            ]
            Firestore.firestore().collection("conversations").document(convId!).collection("messages").addDocument(data: msg) { err in
                if err == nil {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        }
    }
    
    func updateConvo() {
        
    }
    
    func getConvoId() {
        
    }
    
    func getAllMessage() {
        
    }
    
    func getOneMessage() {
        
    }
}

