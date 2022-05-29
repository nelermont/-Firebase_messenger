//
//  UserCellTableViewCell.swift
//  ReadWrite_Firebase
//
//  Created by Дмитрий Подольский on 29.05.2022.
//

import UIKit

class UserCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var parentView: UIView!
    static let reuseId = "UserCellTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        settingCell()
    }

    func configCell(_ name: String) {
        userName.text = name
    }
    
    func settingCell() {
        parentView.layer.cornerRadius = 10
        userImage.layer.cornerRadius = userImage.frame.width/2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }
    
}
