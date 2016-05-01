//
//  ViewController.swift
//  ReactionTime
//
//  Created by Bruno on 2016-04-29.
//  Copyright © 2016 Bruno Almeida. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var startButton: NSButton!
    @IBOutlet weak var reactionView: NSView!
    @IBOutlet weak var reactionTimeLabel: NSTextField!
    @IBOutlet weak var averageReactionTimeLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func startButtonClicked(sender: NSButton) {
    }

}

