//
//  DetailViewController.swift
//  TableView
//
//  Created by Pedro Paulo on 15/11/17.
//  Copyright © 2017 Pedro Paulo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    
    let dataPosition = ["Professor iOS", "Professor iOS", "Monitor iOS", "Monitor iOS"]
    
    var selectedIndex: Int?
    var instructorName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nameLabel.text = instructorName
        positionLabel.text = dataPosition[selectedIndex!]
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
