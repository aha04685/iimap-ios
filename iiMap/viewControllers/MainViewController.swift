//
//  MainViewController.swift
//  iiMap
//
//  Created by li on 2018/07/21.
//  Copyright © 2018年 li. All rights reserved.
//

import UIKit
import NMAKit
class MainViewController: UIViewController {

    //@IBOutlet var nmaMapView: NMAMapView!
    
    @IBOutlet weak var nmaMapView: NMAMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        showMap()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    func setUpButton(button : UIButton){
        
        button.backgroundColor = Color.MainTintColor
        button.tintColor = UIColor.white
        
        button.layer.cornerRadius = 10.0
        button.layer.masksToBounds = true
    }
    
    func showMap(){
        self.nmaMapView = NMAMapView()
        let geoCoordCenter = NMAGeoCoordinates(latitude: 49.260327, longitude: -123.115025)
        //set map view with geo center
        self.nmaMapView.set(geoCenter: geoCoordCenter, animation: .none)
        //set zoom level
        self.nmaMapView.zoomLevel = 13.2;
        
        self.view.addSubview(nmaMapView)
        
        
    }
}
