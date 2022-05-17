//
//  SignViewController.swift
//  ReadWrite_Firebase
//
//  Created by Дмитрий Подольский on 11.05.2022.
//

import UIKit

class SignViewController: UIViewController {

    var delegate: LoginViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func closeVCAction(_ sender: Any) {
        delegate.closeVC()
    }
}
