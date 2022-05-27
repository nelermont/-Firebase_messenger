//
//  Model.swift
//  ReadWrite_Firebase
//
//  Created by Дмитрий Подольский on 09.05.2022.
//

import Foundation
import UIKit

struct Slides {
    var id: Int
    var text: String
    var img: UIImage
}

struct LoginField {
    var email:String
    var password:String
}

struct ResponseCode {
    var code: Int
}
