//
//  ViewController.swift
//  IngLab-Test
//
//  Created by Mewan Chathuranga on 06/08/2018.
//  Copyright © 2018 Mewan Chathuranga. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var tableViewCell: UITableViewCell!
    
    
    let jsonLoadService = JSONLoadService()
    
    var devDetails = [Int:String]()
    var devArray:[[Int:String]] = []
    var arr:[Int:String]? = nil
    var jsonObj: [DevData]? = nil
    var openedController = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        DispatchQueue.main.async {
            self.jsonLoadService.fetchDocument(docURL: "https://api.myjson.com/bins/a9eh1")
        }
      
        
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { // change 2 to desired number of seconds
            // Your code with delay
            if self.jsonObj?.count == nil {
            self.loadTableView()
            }
        }
    }
    
    func loadTableView(){
        let jsonObject = self.jsonLoadService.getDocumentObj()
        jsonObj = jsonObject
        for object in jsonObject{
            
            if object.isActive == true{
                
                
                self.devDetails = [object.index:object.phone]
                devArray.append(devDetails)
                print (devArray.description)
            }
        }
        if self.tableView != nil{
            self.tableView.reloadData()
        }
            print("DevDetails: ", self.devDetails)
        
      
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
            self.arr = self.devArray[indexPath.row]
        
            for data in self.arr!{
                cell.textLabel?.text = "Developer: \(String(data.key))"
                cell.detailTextLabel?.text = "Phone: \(String(data.value))"
            
        }
        
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        for data in jsonObj!{
                //imageView.image = data.picture
            for details in devArray[indexPath.row]{
                if details.key == data.index{
            vc?.devName = data.name
            vc?.devBalance = data.balance
            vc?.devEmail = data.email
            vc?.devImageURL = data.picture
                }
            }
        }
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }


}

