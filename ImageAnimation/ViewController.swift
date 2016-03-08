//
//  ViewController.swift
//  ImageAnimation
//
//  Created by Deepak Kadarivel on 08/03/16.
//  Copyright © 2016 upbeatios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        animateClouds(imageView)
    }

    func animateClouds(image: UIImageView) {
        let cloudMovingSpeed = 30.0 / view.frame.size.width
        let duration = (view.frame.size.width - image.frame.origin.x) * cloudMovingSpeed
        UIView.animateWithDuration(NSTimeInterval(duration), delay: 0.0, options: [.CurveLinear, .Repeat, .Autoreverse], animations: { () -> Void in
            image.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: image.frame.width + 100, height: image.frame.height + 100)
            }) { _ in
                image.frame.origin.x = 0
                self.animateClouds(image)
        }
    }

}