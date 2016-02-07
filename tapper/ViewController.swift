//
//  ViewController.swift
//  tapper
//
//  Created by Vikas Reddy on 2/7/16.
//  Copyright © 2016 vikas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Outlets
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var tapLbl: UILabel!
    
    //Properties
    var currentTaps = 0
    var maxTaps = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.logoImage.hidden = false
        self.howManyTapsTxt.hidden = false
        self.playBtn.hidden = false
        
        self.howManyTapsTxt.text = ""
        self.tapBtn.hidden = true
        self.tapLbl.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPlayBtnPressed(sender: UIButton!) {
        
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != "" {
            
            logoImage.hidden = true
            playBtn.hidden = true
            howManyTapsTxt.hidden = true
            
            tapBtn.hidden = false
            tapLbl.hidden = false
            
            updateTapsLabel()
            maxTaps = Int(howManyTapsTxt.text!)!
            currentTaps = 0
            
        }
    }
    
    @IBAction func onTapBtnPressed(sender: UIButton!) {
        currentTaps += 1
        updateTapsLabel()
        if  isGameOver() {
            viewDidLoad()
        }
    }
    
    func isGameOver() -> Bool {
        return currentTaps >= maxTaps + 1
    }
    func updateTapsLabel() {
        tapLbl.text = "\(currentTaps) Taps"

    }
}

