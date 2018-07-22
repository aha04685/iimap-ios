//
//  ViewController.swift
//  iiMap
//
//  Created by li on 2018/07/21.
//  Copyright © 2018年 li. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var LoginButton: UIButton!
    @IBOutlet var LoginByInsta: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpButton(button: LoginButton)
        setUpButton(button: LoginByInsta)
        getInitData()
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

    @IBAction func goNext(_ sender: Any) {
        self.performSegue(withIdentifier: "MainView", sender: nil)
    }
    func getInitData(){
        print("****get Init Data")
        let stringUrl = "https://iimap.eu-gb.mybluemix.net/data"
        let url = URL(string: stringUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
        let req = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: req, completionHandler: {
            (data, res, err) in
            if data != nil {
                let text = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                DispatchQueue.main.async(execute: {
                    //  self.resultLabel.text = text as String?
                    do {
                        print(text)
                        let result = try? JSONDecoder().decode(InitData.self, from: data!)
                        //self.yamaList = try JSONSerialization.jsonObject(with: data!, options: [])  as NSArray
                        
                        GlobalUtility.initData = InitData(facebook: result?.facebook, event: result?.event, facility: result?.facility, toilet: result?.toilet)
                        
                        
                        /*
                         let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                         let jsondata = json as! NSArray
                         self.eventList = jsondata["event"] as! NSArray
                         self.facebookList = jsondata["facebook"] as! NSArray
                         */
                        
                        return
                        
                    } catch {
                        print("json convert failed in JSONDecoder", error.localizedDescription)
                        
                    }
                })
            } else {
                DispatchQueue.main.async(execute: {
                    //  self.resultLabel.text = "ERROR"
                })
            }
        })
        task.resume()
        
    }
    
    
}

