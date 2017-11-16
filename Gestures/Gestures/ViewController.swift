//
//  ViewController.swift
//  Gestures
//
//  Created by Pedro Paulo on 12/11/17.
//  Copyright © 2017 Pedro Paulo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ballImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handlePinch(sender: UIPinchGestureRecognizer){
        if let view = sender.view {
            view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
            sender.scale = 1
        }
    }
    
    @IBAction func handlePan(sender: UIPanGestureRecognizer){
        if sender.state == UIGestureRecognizerState.ended{
            let velocity = sender.velocity(in: self.view)
            let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
            let slideMultiplier = magnitude / 200
            print("magnitude: \(magnitude), slideMultiplier: \(slideMultiplier)")
            
            let slideFactor = 0.1 * slideMultiplier
            
            var finalPoint = CGPoint(x: sender.view!.center.x + (velocity.x * slideFactor), y: sender.view!.center.y + (velocity.y * slideFactor))
            
            finalPoint.x = min(max(finalPoint.x,0),self.view.bounds.size.width)
            finalPoint.y = min(max(finalPoint.y,0),self.view.bounds.size.height)
            
            UIView.animate(withDuration: Double(slideFactor * 2), delay: 0, options: .curveEaseOut, animations: {sender.view!.center = finalPoint }, completion: nil)
        }
    }



}

