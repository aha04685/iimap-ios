//
//  MainViewController.swift
//  iiMap
//
//  Created by li on 2018/07/21.
//  Copyright © 2018年 li. All rights reserved.
//

import UIKit
import NMAKit
class MainViewController: UIViewController , NMAMapViewDelegate {
    
    

    //@IBOutlet var nmaMapView: NMAMapView!
    
    @IBOutlet weak var nmaMapView: NMAMapView!
    
    
    var selectedMarker : NMAMapMarker!
    var facebook_info : FacebookMapMarkerWindow!
    
    var facbookMarkers : NMAClusterLayer!
    var eventMarkers : NMAClusterLayer!
    
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
        self.nmaMapView.delegate = self
        facebook_info = FacebookMapMarkerWindow(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        //facebook_info.delegate = self as! MapMarkerDelegate
        sv = UIViewController.displaySpinner(onView: self.view)
        self.nmaMapView.gestureDelegate = self
        
        setupMarker()
        self.nmaMapView.zoomLevel = 13.2
        self.nmaMapView.set(geoCenter: NMAGeoCoordinates(latitude: 25.018495, longitude: 121.938199), animation: .linear)
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
        let geoCoordCenter = NMAGeoCoordinates(latitude : 25.018495, longitude : 121.938199)
        //set map view with geo center
        self.nmaMapView.set(geoCenter: geoCoordCenter, animation: .linear)
        //set zoom level
        self.nmaMapView.zoomLevel = 6.2;
        self.nmaMapView.positionIndicator.isVisible = true
        //self.nmaMapView.p
        self.view.addSubview(nmaMapView)
        
        
    }
    
    
    
    func setupMarker(){
        
        self.facbookMarkers = NMAClusterLayer();
        self.eventMarkers = NMAClusterLayer();
        let faceList = GlobalUtility.initData.facebook
        for facbook in faceList!{
            let lat = Double(facbook.latitude)
            let lon = Double(facbook.longitude)
            
            print("lat->"+facbook.latitude+"lon"+facbook.longitude)
            let geoCoordCenter = NMAGeoCoordinates(latitude : lon!, longitude : lat!)
            let image = UIImage(named: "marker")
            let marker = NMAMapMarker(geoCoordinates: geoCoordCenter , image : image!);
            //self.facbookMarkers.addMarker(marker)
            self.nmaMapView.add(mapObject: marker)
            
        }
        let eventList = GlobalUtility.initData.event
        for facbook in eventList!{
            
            let lat = Double(facbook.latitude)
            let lon = Double(facbook.longitude)
            if (lat == nil || lon == nil) {continue}
            print("lat->"+facbook.latitude+"lon"+facbook.longitude)
            let geoCoordCenter = NMAGeoCoordinates(latitude : lon!, longitude : lat!)
            let image = UIImage(named: "blue_heart")
            var marker = NMAMapMarker(geoCoordinates: geoCoordCenter , image : image!);
            //marker.setValue(facbook, forKey: "facebook")
            //self.eventMarkers.addMarker(marker)
            self.nmaMapView.add(mapObject: marker)
        }
        UIViewController.removeSpinner(spinner: self.sv)
    }
    func loadNiB() -> FacebookMapMarkerWindow {
        let infoWindow = FacebookMapMarkerWindow.instanceFromNib() as! FacebookMapMarkerWindow
        return infoWindow
    }
    
    func showMessage(_ message: String , marker : NMAMapMarker) {
        
        var sampleData = GlobalUtility.initData.facebook[2]
        
        facebook_info.removeFromSuperview()
        
        facebook_info = loadNiB()
        
        facebook_info.backgroundColor = UIColor.white
        facebook_info.alpha = 0.9
        facebook_info.layer.cornerRadius = 12
        facebook_info.layer.borderWidth = 2
        //facebook_info.center = marker.location()
        
        //facebook_info.image.downloadedFrom(link: sampleData.image_url)
        //facebook_info.desc.text = sampleData.description
        self.view.addSubview(self.facebook_info)
        
        /*
        var frame = CGRect(x: 110, y: 200, width: 220, height: 120)
        
        let label = UILabel(frame: frame)
        label.backgroundColor = UIColor.groupTableViewBackground
        label.textColor = UIColor.blue
        label.text = message
        label.numberOfLines = 0
        
        let text = message as NSString
        let options : NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading]
        
        let rect = text.boundingRect(with: frame.size,
                                     options: options,
                                     attributes: [NSAttributedStringKey.font :label.font],
                                     context: nil)
        
        frame.size = rect.size
        label.frame = frame
        
        self.view.addSubview(label)
        
        UIView.animate(withDuration: 2.0,
                       animations: { label.alpha = 0 })
        { _ in label.removeFromSuperview() }
 */
    }
    
    func mapView(_ mapView: NMAMapView, didTapInfoWindowOf marker: NMAMapMarker) {
        
        // it showed a message label for tap gesture
        
        showMessage("Tap gesture" , marker: marker)
        
        //calculate geoCoordinates of tap gesture
        //guard let markerCoordinates = mapView.geoCoordinates(from: location) else { return }
        
        //it added a image icon to map view at location where tap gesture was applied.
        
    }
 
 
}

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
    
    
}



extension MainViewController : NMAMapGestureDelegate {
    /**
     * callback when tap gesture occurred. It showed a image icon at location when tap gesture was applied.
     */
    
    
 
    /**
    func mapView(_ mapView: NMAMapView, didReceivePan translation: CGPoint, at location: CGPoint) {
        facebook_info.removeFromSuperview()
    }
    
    
     * callback when totation gesture occurred. It showed a message when rotation gesture was applied.
 
    
    func mapView(_ mapView: NMAMapView, didReceiveRotation rotation: Float, at location: CGPoint) {
        facebook_info.removeFromSuperview()
    }
  */
    
}
