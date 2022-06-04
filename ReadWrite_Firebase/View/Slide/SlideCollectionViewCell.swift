//
//  SlideCollectionViewCell.swift
//  ReadWrite_Firebase
//
//  Created by Дмитрий Подольский on 08.05.2022.
//

import UIKit

class SlideCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainDescription: UILabel!
    

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var regButtonOutlet: UIButton!
    @IBOutlet weak var signButtonOutlet: UIButton!
    static let reuceId = "SlideCollectionViewCell"
    var delegate: LoginViewControllerDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }

    func configure(slide: Slides) {
        mainImage.image = slide.img
//        mainDescription.text = slide.text
   
        if slide.id == 3 {
            regButtonOutlet.isHidden = false
            signButtonOutlet.isHidden = false
        }
    }
    
    @IBAction func regButton(_ sender: Any) {
        delegate.openRegVC()
    }
    
    @IBAction func signButton(_ sender: Any) {
        delegate.openSignInVC()
    }
    
  
}
