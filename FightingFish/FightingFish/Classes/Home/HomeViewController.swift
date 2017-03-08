//
//  HomeViewController.swift
//  FightingFish
//
//  Created by 王磊 on 2017/3/6.
//  Copyright © 2017年 王磊. All rights reserved.
//

import UIKit

fileprivate var titleViewH : CGFloat = 40
class HomeViewController: UIViewController {

    // MARK: - 懒加载属性
    fileprivate lazy var pageTitleView: PageTitleView = {[weak self] in
        let pageFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: titleViewH)
       let pageTitleView = PageTitleView(frame: pageFrame, titles: ["推荐", "手游", "娱乐", "游戏","趣玩"])
        pageTitleView.delegate = self
        return pageTitleView
    }()
    fileprivate lazy var pageContentView: PageContentView = { [weak self] in
        let pageY :CGFloat = kStatusBarH + kNavigationBarH + titleViewH
        let pageH:CGFloat = kScreenH - pageY
        let pageContentFrame = CGRect(x: 0, y: pageY, width: kScreenW, height: pageH)
        var childers = [UIViewController]()
        for _ in 0..<5{
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childers.append(vc)
        }
        let content = PageContentView(frame: pageContentFrame, childControllers: childers, parentController: self)
        return content
    }()
    
    // MARK: - 父类方法
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1.初始化UI
        customUI()
    }
}
// MARK: - View相关
extension HomeViewController{
    fileprivate func customUI(){
        // 0.不需要自动偏移
        automaticallyAdjustsScrollViewInsets = false
        // 1.设置导航栏按钮
        setUpNavigationBar()
        // 2.添加pageTitleView
        view.addSubview(pageTitleView)
        // 3.添加pageContentView
        view.addSubview(pageContentView)

    }
    
    fileprivate func setUpNavigationBar(){
        // 1.设置左侧的BarButtonItem
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        // 2.设置右侧的BarButtonItem
        let size = CGSize(width: 40, height: 40)
        let history = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        let scan = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        let search = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        navigationItem.rightBarButtonItems = [search, scan, history ]
    }
}
// MARK: - pageTitleDelegate
extension HomeViewController: PageTitleViewDelegate{
    func pageTitleViewScrollLine(_ titleView: PageTitleView, seletedInde index: Int) {
        print(index)
        pageContentView.pageContenViewScrollIndex(index)
    }
}
