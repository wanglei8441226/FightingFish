//
//  PageTitleView.swift
//  FightingFish
//
//  Created by 王磊 on 2017/3/6.
//  Copyright © 2017年 王磊. All rights reserved.
//

import UIKit

fileprivate var kScrolllineH:CGFloat = 2
class PageTitleView: UIView {
     // MARK: - 定义属性
    
    fileprivate var titles:[String]
    
    // MARK: - 懒加载属性
    fileprivate lazy var titleLabels = [UILabel]()
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    fileprivate lazy var scrollline: UIView = {
       let scrollline = UIView()
        scrollline.backgroundColor = UIColor.orange
        return scrollline
    }()
    
    init(frame: CGRect, titles:[String]) {
        self.titles = titles
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
// MARK: - 设置UI界面
extension PageTitleView{
    fileprivate func setupUI(){
        // 1.添加scrollView
        addSubview(scrollView)
        scrollView.frame = bounds
        
        //2.添加对应的label
        addTitleLabel()
        
        // 3.添加scrollLine
        addBottomLineAndScrollLine()
    }
    
    // MARK: - 添加label
    fileprivate func addTitleLabel(){
        // 1.循环添加label
        let labelW :CGFloat = frame.width / CGFloat(titles.count)
        let labelH :CGFloat = frame.height - kScrolllineH
        let labelY :CGFloat = 0

        for (index, title) in titles.enumerated(){
            // 1.设置labelframe
            let labelX :CGFloat = labelW  * CGFloat(index)
            let label = UILabel(frame: CGRect(x: labelX, y: labelY, width: labelW, height: labelH))
            
            // 2.设置label属性
            label.text = title
            label.tag = index
            label.textAlignment = .center
            label.textColor = UIColor.orange
            label.font = UIFont.systemFont(ofSize: 16)
            // 3.添加到scrollView
            scrollView.addSubview(label)
            // 4.添加到titleLabels
            titleLabels.append(label)
        }
    }
    
    // MARK: - 添加scrollLabel
    fileprivate func addBottomLineAndScrollLine(){
        // 1.添加bottomLine
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.darkGray
        let bottomLineH :CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - bottomLineH, width: frame.width, height: bottomLineH)
        addSubview(bottomLine)
        
        // 2.获取第一个label
        guard let firstLabel = titleLabels.first else { return }
        // 3.添加scrollLine
        scrollView.addSubview(scrollline)
        scrollline.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kScrolllineH, width: firstLabel.frame.width, height: kScrolllineH)
        
    }
}
