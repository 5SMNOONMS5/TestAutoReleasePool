//
//  ViewController.swift
//  TestAutoreleasepool
//
//  Created by Stephen Chen on 23/1/2017.
//  Copyright © 2017 fcloud. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    fileprivate var isDone: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
          withAutoreleasepool()
//          withoutAutoreleasepool()
    }

    func withoutAutoreleasepool() {
        
        guard let path = Bundle.main.path(forResource: "1", ofType: "png", inDirectory: nil) else {
            return
        }
        
        while isDone {
            let _ : UIImage = UIImage(contentsOfFile: path)!
        }
    }
    
    func withAutoreleasepool() {
        
        guard let path = Bundle.main.path(forResource: "1", ofType: "png", inDirectory: nil) else {
            return
        }
        
        while isDone {
            autoreleasepool { _ in
                let _ : UIImage = UIImage(contentsOfFile: path)!
            }
        }
    }
}

