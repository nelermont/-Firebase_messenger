//
//  LoginViewController.swift
//  ReadWrite_Firebase
//
//  Created by Дмитрий Подольский on 08.05.2022.
//

import UIKit

protocol LoginViewControllerDelegate {
    func openRegVC()
    func openSignInVC()
    func closeVC()
}

class LoginViewController: UIViewController {

    var collectionView: UICollectionView!
    let slideClass = SlideClass()
    var signInVC: SignViewController!
    var regVC: RegViewController!
    
    var slides:[Slides] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        
        slides = slideClass.getSlides()
    }
    
    func configCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .gray
        collectionView.isPagingEnabled = true
        
        self.view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: SlideCollectionViewCell.reuceId, bundle: nil), forCellWithReuseIdentifier: SlideCollectionViewCell.reuceId)
    }
}

extension LoginViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlideCollectionViewCell.reuceId, for: indexPath) as! SlideCollectionViewCell
        cell.delegate = self
        let slide = slides[indexPath.row]
        cell.configure(slide: slide)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.view.frame.size
    }
    }
    
extension LoginViewController: LoginViewControllerDelegate{
   
    func openRegVC() {
        regVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegViewController") as? RegViewController
        regVC.delegate = self
        self.view.insertSubview(regVC.view, at: 1)
    }
    
    func openSignInVC() {
        signInVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignViewController") as? SignViewController
        signInVC.delegate = self
        self.view.insertSubview(signInVC.view, at: 1)
    }
    
    func closeVC() {
        if signInVC != nil {
            signInVC.view.removeFromSuperview()
            signInVC = nil
        }
        
        if regVC != nil {
            regVC.view.removeFromSuperview()
            regVC = nil
        }
   
    }
}

