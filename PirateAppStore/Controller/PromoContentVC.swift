//
//  PromoContentVC.swift
//  PirateAppStore
//
//  Created by Nick on 7/9/19.
//  Copyright © 2019 nicksdev. All rights reserved.
//

import UIKit

class PromoContentVC: UIViewController {

    @IBOutlet weak var promoIV: UIImageView!
    
    
    var pageIndex = 0
    var imageName: String?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let currentImage = imageName{
            promoIV.image = UIImage(named: currentImage)
        }



    }
    

    
    // MARK: - Ibactions

    
    
    // MARK: - Navigation

    

}
