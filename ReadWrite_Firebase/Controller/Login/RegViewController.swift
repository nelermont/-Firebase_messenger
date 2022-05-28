//
//  RegViewController.swift
//  ReadWrite_Firebase
//
//  Created by Дмитрий Подольский on 11.05.2022.
//

import UIKit

class RegViewController: UIViewController {

    var delegate: LoginViewControllerDelegate!
    var checkField = CheckField.shared
    var service = Service.shared
    
    @IBOutlet weak var mainView: UIView!
    var tapGest: UITapGestureRecognizer?
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var rePassField: UITextField!
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passView: UIView!
    @IBOutlet weak var repassView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGest = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        mainView.addGestureRecognizer(tapGest!)
    }
    
    @IBAction func closeVCAction(_ sender: Any) {
        delegate.closeVC()
    }
    @objc func endEditing() {
        self.view.endEditing(true)
    }
    
    @IBAction func regBtnAction(_ sender: Any) {
        if checkField.validField(emailView, emailField),
           checkField.validField(passView, passField)
        {
            if passField.text == rePassField.text{
                service.createNewUser(LoginField(email: emailField.text!, password: passField.text!)) { [weak self] code in
                    switch code.code {
                    case 0:
                        print("Ошибка регистрации")
                    case 1:
                        self?.service.confrimEmail()
                        let alert = UIAlertController(title: "OK", message: "Success", preferredStyle: .alert)
                        let okBtn = UIAlertAction(title: "Auth", style: .default) { _ in
                            self?.delegate.closeVC()
                        }
                        alert.addAction(okBtn)
                        self?.present(alert, animated: true)
                    default:
                        print("не понятно")
                    }
                }
            } else {
                
            }
    
        }
    }
}
