//
//  TempTableViewCell.swift
//  PracticeSwiftProject
//
//  Created by Sky Zhang on 2017/6/1.
//  Copyright © 2017年 Sky.Zhang. All rights reserved.
//

import UIKit

protocol TempTableViewCellDelegate: NSObjectProtocol {
    func getTitle(cell: TempTableViewCell, title: String)
}
class TempTableViewCell: UITableViewCell {

    lazy var contentLabel = UILabel()
    
    weak var delegate: TempTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI () {
        
        contentLabel.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height);
        contentLabel.font = UIFont.systemFont(ofSize: 24)
        contentLabel.isUserInteractionEnabled = true
        contentView.addSubview(contentLabel)
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(TempTableViewCell.labelTapAction))
        contentLabel.addGestureRecognizer(labelTap)
    }
    
    func labelTapAction() {
        
        if delegate != nil {
            delegate?.getTitle(cell: self, title: contentLabel.text!)
        }
    }
    
    func setIndex(_ index: Int) {
        contentLabel.text = "第\(index)行"
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
