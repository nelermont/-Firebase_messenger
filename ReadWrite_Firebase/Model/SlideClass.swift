//
//  SlideClass.swift
//  ReadWrite_Firebase
//
//  Created by Дмитрий Подольский on 11.05.2022.
//


import UIKit

class SlideClass {
    func getSlides() -> [Slides] {
        var slides: [Slides] = []
        
        let slide1 = Slides(id: 1, text: "text1", img: UIImage(named: "ImgReadWrite2")!)
        let slide2 = Slides(id: 2, text: "text2", img: UIImage(named: "ImgReadWrite2")!)
        let slide3 = Slides(id: 3, text: "text2", img: UIImage(named: "ImgReadWrite2")!)
        
        slides.append(slide1)
        slides.append(slide2)
        slides.append(slide3)
        return slides
    }
}
