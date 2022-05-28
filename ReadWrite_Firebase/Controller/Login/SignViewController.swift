//
//  SignViewController.swift
//  ReadWrite_Firebase
//
//  Created by Дмитрий Подольский on 11.05.2022.
//

import UIKit

class SignViewController: UIViewController {

    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordField: UITextField!
    
    var userDefault = UserDefaults.standard
    var checkField = CheckField.shared
    var delegate: LoginViewControllerDelegate!
    var service = Service.shared
    
    var tapGest: UITapGestureRecognizer?
    
    @IBOutlet weak var mainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGest = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        mainView.addGestureRecognizer(tapGest!)
    }
    
    @objc func endEditing() {
        self.view.endEditing(true)
    }
    
    
    @IBAction func SignInBtn(_ sender: Any) {
        if checkField.validField(emailView, emailField),
           checkField.validField(passwordView, passwordField) {
            
            let authData = LoginField(email: emailField.text!, password: passwordField.text!)
            
            service.authInApp(authData) { [weak self] responce in
                switch responce {
                case .success:
                    self?.userDefault.set(true, forKey: "isLogin")
                    self?.delegate.startApp()
                    self?.delegate.closeVC()
                case .noVerify:
                    let alert = self?.alertAction("Error", "Not Verify. Go to your email")
                    let verifyBtn = UIAlertAction(title: "Verify", style: .cancel)
                    alert?.addAction(verifyBtn)
                    self?.present(alert!, animated: true)
                case .error:
                    let alert = self?.alertAction("Error", "Email or password is not correct")
                    let verifyBtn = UIAlertAction(title: "Verify", style: .cancel)
                    alert?.addAction(verifyBtn)
                    self?.present(alert!, animated: true)
                }
            }
        }
        else {
            let alert = self.alertAction("Error", "Check the entered data")
            let verifyBtn = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(verifyBtn)
            self.present(alert, animated: true)
        }
    }
    
    func alertAction(_ header:String?, _ message: String?) -> UIAlertController {
        let alert = UIAlertController(title: header, message: message, preferredStyle: .alert)
        return alert
    }
    
    @IBAction func closeVCAction(_ sender: Any) {
        delegate.closeVC()
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
    }
}
