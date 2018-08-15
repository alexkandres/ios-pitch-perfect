//
//  ViewController.swift
//  testAppEDT
//
//  Created by Andres, Alex K. on 8/14/18.
//  Copyright © 2018 Andres, Alex K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelOutlet: UILabel!
    
    //lifecycle - this executes 1st
    override func viewDidLoad() {
        super.viewDidLoad()
        print("didload")
        // Do any additional setup after loading the view, typically from a nib.
        // no views on screen yet
    }
    
    //lifecycle - this executes 2nd
    override func viewWillAppear(_ animated: Bool) {
        //about to be on screen, but not yet
        print("willappear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAction(_ sender: Any) {
        print("Record button pressed")
        labelOutlet.text = "new text"
    }
    
    @IBAction func stopRecordingAction(_ sender: Any) {
        print("stop recording button")
    }
}

