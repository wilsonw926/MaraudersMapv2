//
//  ProfileViewController.swift
//  MarauderMap
//
//  Created by JC Dy on 4/25/17.
//  Copyright © 2017 Wilson Wang. All rights reserved.
//

import UIKit
import FirebaseDatabase

class FriendsViewController: UIViewController {

    var ref:FIRDatabaseReference?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var bio: UILabel!
    @IBOutlet weak var name: UILabel!
    
    /// This profile picture variable will hold the image obtained from Firebase
    var profilePic: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()
//        if let img = profilePic {
//            imageView.image = img
//        }
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
