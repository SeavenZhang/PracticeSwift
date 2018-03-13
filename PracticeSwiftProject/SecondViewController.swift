//
//  SecondViewController.swift
//  PracticeSwiftProject
//
//  Created by Sky Zhang on 2017/6/1.
//  Copyright © 2017年 Sky.Zhang. All rights reserved.
//

import UIKit

protocol SecondCollectionVCDelegate: NSObjectProtocol {
    
    func getVCTitle(VCTitle: String)

}

typealias SecondVCClosure = (_ VCTitle: String) -> ()

class SecondViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    weak var delegate: SecondCollectionVCDelegate?
    
    var callbackClosure = SecondVCClosure?()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blue
        view.addSubview(tempCollectionView)
        
        // Do any additional setup after loading the view.
    }

    fileprivate lazy var tempCollectionView : UICollectionView = {
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.itemSize = CGSize(width: 100, height: 100)
        flowlayout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20)
        flowlayout.minimumLineSpacing = 10
        flowlayout.minimumInteritemSpacing = 20
        flowlayout.scrollDirection = .vertical
        
        let tempCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight), collectionViewLayout: flowlayout)
        
        tempCollectionView.delegate = self
        tempCollectionView.dataSource = self 
        tempCollectionView.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        tempCollectionView.register(SecondCollectionViewCell.self , forCellWithReuseIdentifier: secondCollectionViewCell)
        
        return tempCollectionView
        
    }()
    
   
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: secondCollectionViewCell, for: indexPath) as! SecondCollectionViewCell
        cell.setIndex(indexPath.row)
        return cell
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        if delegate != nil {
            delegate?.getVCTitle(VCTitle: "回传" + title!)
        }
        
        if callbackClosure != nil {
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
