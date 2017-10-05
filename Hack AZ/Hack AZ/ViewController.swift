//
//  ViewController.swift
//  Hack AZ
//
//  Created by Cody Deeran on 10/1/17.
//  Copyright © 2017 Cody Deeran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    let cellContent = ["Schedule","Map","Activities", "Events", "Mentors" ,"Sponsors"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellContent.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let rowPressed = indexPath.row
        let cellPressed = tableView.cellForRow(at: indexPath)
        if rowPressed == 0{
            print("Schedule was pressed! Starting segue....")
            performSegue(withIdentifier: "ScheduleViewController", sender: cellPressed)
        }else if rowPressed == 1 {
            print("row 1 was pressed!")
        }else if rowPressed == 2 {
            print("row 2 was pressed!")
        }else if rowPressed == 3 {
            print("row 3 was pressed!")
        }else if rowPressed == 4 {
            print("row 4 was pressed!")
        }else if rowPressed == 5 {
            print("row 5 was pressed!")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "mainCell")
        cell.contentView.backgroundColor = UIColor(red: CGFloat(164)/255.0, green: CGFloat(125)/255.0, blue: CGFloat(196)/255.0, alpha: 1.0)
        cell.textLabel?.text = cellContent[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Arial", size:22.0)
        cell.textLabel?.textColor = UIColor.white
        return cell
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
