//
//  SecondCollectionViewCell.swift
//  PracticeSwiftProject
//
//  Created by Sky Zhang on 2017/6/1.
//  Copyright © 2017年 Sky.Zhang. All rights reserved.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {
    
    lazy var contentLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        
        contentLabel.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        contentLabel.textAlignment = .center
        contentLabel.font = UIFont.systemFont(ofSize: 25)
        contentView.addSubview(contentLabel)
    }
    
    func setIndex(_ index: Int) {
        
        contentLabel.text = "我是老\(index)"
    }
}
