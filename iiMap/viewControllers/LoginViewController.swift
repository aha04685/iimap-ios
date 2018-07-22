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
    
}

