//
//  TableViewController.swift
//  PracticeSwiftProject
//
//  Created by Sky Zhang on 2017/5/31.
//  Copyright © 2017年 Sky.Zhang. All rights reserved.
//

import UIKit


class TableViewController: UITableViewController, TempTableViewCellDelegate, SecondCollectionVCDelegate {
    
    fileprivate lazy var tempTbleView: UITableView = {
        
        let tempTbleView = UITableView()
        
        tempTbleView.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight)
        tempTbleView.delegate = self
        tempTbleView.dataSource = self
        tempTbleView.allowsSelection = false
//        tempTbleView.register(TempTableViewCell.self, forCellReuseIdentifier: tempTableViewCell)
        
        tempTbleView.rowHeight = 55
        
        return tempTbleView
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
       view.addSubview(tempTbleView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell: TempTableViewCell = tableView.dequeueReusableCell(withIdentifier: tempTableViewCell, for: indexPath) as! TempTableViewCell
      let cell = TempTableViewCell(style: .default, reuseIdentifier: tempTableViewCell)
      cell.delegate = self
      cell.setIndex(indexPath.row)
    
    
        return cell
    }
 
    func getTitle(cell: TempTableViewCell, title: String) {
        print(title)
        let secondVC = SecondViewController()
        secondVC.title = title
        secondVC.delegate = self
        navigationController?.pushViewController(secondVC, animated: true)
        
    }
    
    func getVCTitle(VCTitle: String) {
        print(VCTitle)
       title = VCTitle
    }
    
    func block(_ title: String){
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("第 \(indexPath.row)  行")
    }
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 55
//    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
