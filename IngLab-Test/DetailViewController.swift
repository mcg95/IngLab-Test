//
//  DetailViewController.swift
//  IngLab-Test
//
//  Created by Mewan Chathuranga on 07/08/2018.
//  Copyright © 2018 Mewan Chathuranga. All rights reserved.
//

import UIKit

class DetailViewController: ViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var balanceText: UITextField!
    @IBOutlet weak var remarkBtn: UIButton!
    
    var devName:String = ""
    var devBalance: String = ""
    var devEmail: String = ""
    var devImageURL: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameText.isEnabled = false
        emailText.isEnabled = false
        balanceText.isEnabled = false

        let imageDownload = ImageLoadService()
         DispatchQueue.global(qos: .background).async {
            imageDownload.downloadImage(withURL: URL(string: self.devImageURL)!) { (image) in
                if image == nil{
                    print("Could not load image!")
                } else {
                DispatchQueue.main.async {
                    
                    self.imageView.image = image
                    
                }
            }
            }
            
        }
        print(devImageURL)
                nameText.text = devName
                emailText.text = devBalance
                balanceText.text = devEmail
        
        
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
