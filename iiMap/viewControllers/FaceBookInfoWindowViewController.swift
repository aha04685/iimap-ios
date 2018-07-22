//
//  FaceBookInfoWindowViewController.swift
//  iiMap
//
//  Created by li on 2018/07/22.
//  Copyright © 2018年 li. All rights reserved.
//

import Foundation
import UIKit


protocol MapMarkerDelegate: class {
    func didTapInfoButton(data: NSDictionary)
}

class FacebookMapMarkerWindow: UIView {
    
    @IBOutlet var image: UIImageView!
    
    
    @IBOutlet var desc: UILabel!
    
    @IBOutlet var showRoute: UIButton!
    weak var delegate: MapMarkerDelegate?
    
    
    @IBAction func didTapInfoButton(_ sender: Any) {
       
        
        
    }
    
    func getDifficulty(diff : String) -> String{
        let num = Int(diff)!
        var result = "★"
        
        for _ in (0 ..< num) {
            result.append("★")
        }
        return result
    }
    
    
    
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "MapMarkerWindowView", bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
    }
}

