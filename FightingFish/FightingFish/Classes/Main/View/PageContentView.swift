//
//  ContentView.swift
//  FightingFish
//
//  Created by 王磊 on 2017/3/6.
//  Copyright © 2017年 王磊. All rights reserved.
//

import UIKit

fileprivate let collectionId = "collectionId"
class PageContentView: UIView {

    // MARK: - 定义属性
    fileprivate var childVCs = [UIViewController]()
    fileprivate weak var parentVC: UIViewController?
    fileprivate var boundSize = CGSize()
    // MARK: - 懒加载
    fileprivate lazy var collectionView: UICollectionView = {[weak self] in
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        layout.itemSize = (self?.bounds.size)!
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionId)
        return collectionView
    }()
    // MARK: - 自定义构造函数
    init(frame: CGRect, childControllers: [UIViewController], parentController: UIViewController?) {
        self.childVCs = childControllers
        self.parentVC = parentController
        super.init(frame: frame)
        self.boundSize = bounds.size
        // 1.设置UI
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - 设置UI
extension PageContentView{
    fileprivate func setupUI(){
        // 1.添加自控制器到父控制器
        for i in childVCs {
            parentVC?.addChildViewController(i)
        }
        // 2.添加collection
        addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.frame = bounds
    }
}
extension PageContentView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVCs.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionId, for: indexPath)
        for  view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        let child = childVCs[indexPath.item]
        child.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(child.view)
        
        return cell
    }
}
// MARK: - 暴露的外部方法
extension PageContentView {
    func pageContenViewScrollIndex(_ index: Int){
        let offsetX = CGFloat(index) * frame.size.width
        collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: false)
    }
}
