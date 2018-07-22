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
    
    var sv : UIView!
    var initData : InitData!
    var facebookList : NSArray!
    var eventList : NSArray!
    /*
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        //showMap()
        
    }
 */
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sv = UIViewController.displaySpinner(onView: self.view)
        //self.nmaMapView.gestureDelegate = self
        
        setupMarker()
        self.nmaMapView.zoomLevel = 13.2
        self.nmaMapView.set(geoCenter: NMAGeoCoordinates(latitude: 25.048078, longitude: 121.517078), animation: .linear)
        self.nmaMapView.copyrightLogoPosition = NMALayoutPosition.bottomCenter
        self.nmaMapView.positionIndicator.isVisible = true
        
        //UIViewController.removeSpinner(spinner: self.sv)
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
        //self.nmaMapView.
        self.nmaMapView.copyrightLogoPosition = NMALayoutPosition.bottomCenter
        let geoCoordCenter = NMAGeoCoordinates(latitude : 25.048078, longitude : 121.517078)
        //set map view with geo center
        self.nmaMapView.set(geoCenter: geoCoordCenter, animation: .linear)
        //set zoom level
        self.nmaMapView.zoomLevel = 6.2;
        self.nmaMapView.positionIndicator.isVisible = true
        //self.nmaMapView.p
        self.view.addSubview(nmaMapView)
        
        
    }
    
    
    
    func setupMarker(){
        
        let faceList = GlobalUtility.initData.facebook
        for facbook in faceList!{
            let lat = Double(facbook.latitude)
            let lon = Double(facbook.longitude)
            
            print("lat->"+facbook.latitude+"lon"+facbook.longitude)
            let geoCoordCenter = NMAGeoCoordinates(latitude : lon!, longitude : lat!)
            let image = UIImage(named: "marker")
            let marker = NMAMapMarker(geoCoordinates: geoCoordCenter , image : image!);
            self.nmaMapView.add(mapObject: marker)
        }
        UIViewController.removeSpinner(spinner: self.sv)
    }
 
}
