//
//  FinalViewController.swift
//  buttons
//
//  Created by Pedro Paulo on 10/11/17.
//  Copyright © 2017 Pedro Paulo. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.performSegue(withIdentifier: "backSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "backSegue"){
            //caso queira passar alguma coisa antes de mudar tela
            //escrever código aqui
        }
    }
}
