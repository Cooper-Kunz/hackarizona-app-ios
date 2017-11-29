//
//  DisplaySchedule.swift
//  Hack AZ
//
//  Created by Cody Deeran on 11/19/17.
//  Copyright © 2017 Cody Deeran. All rights reserved.
//

import UIKit

class DisplayMasterSchedule: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var eventType = [String]()
    var eventTitle = [String]()
    var eventSubTitle = [String]()
    var day = [String]()
    var time = [String]()
    var location = [String]()
    let url = URL(string: "http://hackarizona.org/masterschedule.json")!
    
    private func eventDataHelper(day: String!, jsonfile: [String: Any]?) {
        if let jsonData = (jsonfile![day] as? NSArray) {
            for index in 0...(jsonData.count-1) {
                self.eventType.append((jsonData[index] as? NSDictionary)?["eventtype"] as! String)
                self.eventTitle.append((jsonData[index] as? NSDictionary)?["eventtitle"] as! String)
                self.eventSubTitle.append((jsonData[index] as? NSDictionary)?["subtitle"] as! String)
                self.day.append((jsonData[index] as? NSDictionary)?["day"] as! String)
                self.time.append((jsonData[index] as? NSDictionary)?["time"] as! String)
                self.location.append((jsonData[index] as? NSDictionary)?["location"] as! String)
            }
        }
    }
    
    func getEventData() -> Void{
        // Setup the url for hackAZ
        let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
            if error != nil {
                print(error!)
            }else{
                if let urlContent = data {
                    do {
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options:JSONSerialization.ReadingOptions.mutableContainers) as? [String: Any]
                        if let title = self.title {
                            if title == "FRIDAY_SCHEDULE" {
                                self.eventDataHelper(day: "friday", jsonfile: jsonResult)
                            } else if title == "SATURDAY_SCHEDULE" {
                                self.eventDataHelper(day: "saturday", jsonfile: jsonResult)
                            } else if title == "SUNDAY_SCHEDULE" {
                                self.eventDataHelper(day: "sunday", jsonfile: jsonResult)
                            }
                        }
                    } catch {
                        print("JSON Processing Failed!")
                    }
                }
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "mainCell")
        cell.contentView.backgroundColor = UIColor(red: CGFloat(75)/255.0, green: CGFloat(79)/255.0, blue: CGFloat(128)/255.0, alpha: 1.0)
        cell.textLabel?.textColor = UIColor.white
        if eventType[indexPath.row] == "required" {
            cell.textLabel?.text = "\u{1F335}" + "\t " +  eventTitle[indexPath.row]
            if eventSubTitle[indexPath.row] != "" {
                cell.textLabel?.text = "\u{1F335}" + "\t " +  eventTitle[indexPath.row] + "\n" + "\t " + eventSubTitle[indexPath.row]
            }
        }
        if eventType[indexPath.row] == "food"{
            let food = eventTitle[indexPath.row]
            if food.lowercased() == "breakfast"{
                cell.textLabel?.text =  "\u{2615}" + "\t " +  eventTitle[indexPath.row]
            } else if food.lowercased() == "lunch"{
                cell.textLabel?.text =  "\u{1F96A}" + "\t " +  eventTitle[indexPath.row]
            } else if food.lowercased() == "dinner"{
                cell.textLabel?.text =  "\u{1F32E}" + "\t " +  eventTitle[indexPath.row]
            }
        }
        if eventType[indexPath.row] == "activity"{
            cell.textLabel?.text =  "\u{1F3C3}\u{200D}\u{2642}\u{FE0F}" + "\t " + eventTitle[indexPath.row]
            if eventSubTitle[indexPath.row] != "" {
                cell.textLabel?.text = "\u{1F3C3}\u{200D}\u{2642}\u{FE0F}" + "\t " +  eventTitle[indexPath.row] + "\n" + "\t " + eventSubTitle[indexPath.row]
            }
        }
        if eventType[indexPath.row] == "techtalk"{
            cell.textLabel?.text = "\u{1F468}\u{200D}\u{1F4BB}" + "\t " + eventTitle[indexPath.row]
            if eventSubTitle[indexPath.row] != "" {
                cell.textLabel?.text = "\u{1F468}\u{200D}\u{1F4BB}" + "\t " +  eventTitle[indexPath.row] + "\n" + "\t " + eventSubTitle[indexPath.row]
            }
        }
        if eventType[indexPath.row] == "firstbyte"{
            cell.textLabel?.text = "\u{1F469}\u{200D}\u{1F3EB}" + "\t " + eventTitle[indexPath.row]
            if eventSubTitle[indexPath.row] != "" {
                cell.textLabel?.text = "\u{1F469}\u{200D}\u{1F3EB}" + "\t " +  eventTitle[indexPath.row] + "\n" + "\t " + eventSubTitle[indexPath.row]
            }
        }
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.textLabel?.font = UIFont(name: "Arial", size:24.0)
        cell.detailTextLabel?.numberOfLines = 0
        cell.detailTextLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.detailTextLabel?.text = "\t Time: " + time[indexPath.row] + "\n" + "\t Location: " + location[indexPath.row]
        cell.detailTextLabel?.font = UIFont(name: "Arial", size:18.0)
        cell.detailTextLabel?.textColor = UIColor.black
        //cell.detailTextLabel?.textColor = UIColor(red: CGFloat(164)/255.0, green: CGFloat(125)/255.0, blue: CGFloat(196)/255.0, alpha: 1.0)
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getEventData()
        sleep(1)
        // Do any additional setup after loading the view.
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
