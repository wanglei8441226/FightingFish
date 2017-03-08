//
//  UIColor+Extension.swift
//  FightingFish
//
//  Created by 王磊 on 2017/3/6.
//  Copyright © 2017年 王磊. All rights reserved.
//

import UIKit


extension UIColor{
    convenience init(r:CGFloat, g:CGFloat, b:CGFloat ) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
}
