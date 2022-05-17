//
//  RegViewController.swift
//  ReadWrite_Firebase
//
//  Created by Дмитрий Подольский on 11.05.2022.
//

import UIKit

class RegViewController: UIViewController {

    var delegate: LoginViewControllerDelegate!

    @IBOutlet weak var mainView: UIView!
    var tapGest: UITapGestureRecognizer?
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var rePassField: UITextField!
    
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
    }
}
