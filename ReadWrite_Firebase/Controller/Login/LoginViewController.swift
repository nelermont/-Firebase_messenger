//
//  LoginViewController.swift
//  ReadWrite_Firebase
//
//  Created by Дмитрий Подольский on 08.05.2022.
//

import UIKit

class LoginViewController: UIViewController {

    var collectionView: UICollectionView!
    var slides:[Slides] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        
        let slide1 = Slides(text: "text1", img: UIImage(named: "ImgReadWrite")!)
        let slide2 = Slides(text: "text2", img: UIImage(named: "ImgReadWrite")!)
        let slide3 = Slides(text: "text2", img: UIImage(named: "ImgReadWrite")!)
        
        slides.append(slide1)
        slides.append(slide2)
        slides.append(slide3)
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
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.view.frame.size
    }
    }
    
    

