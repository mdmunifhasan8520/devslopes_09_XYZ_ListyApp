//
//  ParalaxCell.swift
//  devslopes_09_XYZ_ListyApp
//
//  Created by Mac PC on 5/4/20.
//  Copyright © 2020 Ticon. All rights reserved.
//

import UIKit

class ParallaxCell: UITableViewCell {

    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var rowLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        clipsToBounds = true
//        bgImageView.contentMode = .scaleAspectFill
//        bgImageView.clipsToBounds = false
        setupParallax()
    }
    
    func configureCell(withImage image: UIImage, andDescription desc: String) {
        bgImageView.image = image
        rowLbl.text = desc
    }

    func setupParallax() {
        let min = CGFloat(-30)
        let max = CGFloat(30)
        
        let xMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.x", type: .tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = min
        xMotion.maximumRelativeValue = max
        
        let yMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.y", type: .tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = min
        yMotion.maximumRelativeValue = max
        
        let motionEffectGroup = UIMotionEffectGroup()
        motionEffectGroup.motionEffects = [xMotion,yMotion]
        
        bgImageView.addMotionEffect(motionEffectGroup)
        
    }

}
