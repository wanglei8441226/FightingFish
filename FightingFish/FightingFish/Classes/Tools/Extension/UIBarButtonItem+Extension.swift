//
//  UIBarButtonItem+Extension.swift
//  FightingFish
//
//  Created by 王磊 on 2017/3/6.
//  Copyright © 2017年 王磊. All rights reserved.
//

import UIKit
extension UIBarButtonItem{
    
    convenience init(imageName:String, highImageName:String = "", size:CGSize = CGSize.zero) {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        if highImageName != ""{
            btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        if size == .zero{
            btn.sizeToFit()
        }else{
            btn.frame = CGRect(origin: .zero, size: size)
        }
        
        self.init(customView: btn)

    }
}
