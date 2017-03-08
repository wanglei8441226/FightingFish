//
//  MainViewController.swift
//  FightingFish
//
//  Created by 王磊 on 2017/3/6.
//  Copyright © 2017年 王磊. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addChildViewController(name: "Home")
        addChildViewController(name: "Live")
        addChildViewController(name: "Follow")
        addChildViewController(name: "Discover")
        addChildViewController(name: "Mine")
        
    }
    // 添加到tabViewController
    fileprivate func addChildViewController(name:String){
        let vc = UIStoryboard(name: name, bundle: nil).instantiateInitialViewController()!
        addChildViewController(vc)
    }


    
}
