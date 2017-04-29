//
//  NearbyViewController.swift
//  MarauderMap
//
//  Created by JC Dy on 4/25/17.
//  Copyright © 2017 Wilson Wang. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

class NearbyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "NearbyToProfile", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "NearbyToProfile" {
                if let dest = segue.destination as? ProfileViewController {
                    
                    // This should be where we get the profile picture from Firebase
                    dest.profilePic = nil
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nearbyCell") as! NearbyTableViewCell
        
        // Get the image from Firebase!!
//        if let image = GET FROM FIREBASE {
//            cell.nearbyPic.image = image
//        }
        cell.nearbyName.text = "Wilson Wang"
        return cell
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
