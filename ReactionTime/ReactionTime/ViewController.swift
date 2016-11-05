//
//  ViewController.swift
//  ReactionTime
//
//  Created by Bruno on 2016-04-29.
//  Copyright © 2016 Bruno Almeida. All rights reserved.
//

import Cocoa
import Quartz

class ViewController: NSViewController {
    
    fileprivate static let delayBeforeFirstTarget: Double = 0.1
    fileprivate static let delayBetweenTargets: Double = 1
    
    fileprivate static let numberOfColumns: Int = 3
    fileprivate static let numberOfRows: Int = 3

    @IBOutlet weak var startButton: NSButton!
    @IBOutlet weak var targetGridView: NSView!
    @IBOutlet weak var reactionTimeLabel: NSTextField!
    @IBOutlet weak var averageReactionTimeLabel: NSTextField!
    
    var targetView: NSView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func startButtonClicked(_ sender: NSButton) {
        print("startButtonClicked()")
        
        _ = Timer.scheduledTimer(
                timeInterval: ViewController.delayBeforeFirstTarget,
                target: self,
                selector: #selector(displayTarget),
                userInfo: nil,
                repeats: false)
    }
    
    func displayTarget() {
        print("displayTarget()")
        
        let targetColumn = Int(arc4random()) % 3
        let targetRow = Int(arc4random()) % 3
        
        let targetWidth = Int(targetGridView.frame.size.width) / ViewController.numberOfColumns
        let targetHeight = Int(targetGridView.frame.size.height) / ViewController.numberOfRows
        
        let targetX = targetColumn * targetWidth
        let targetY = targetRow * targetHeight
        
        print("targetColumn = \(targetColumn), targetRow = \(targetRow), " +
            "targetWidth = \(targetWidth), targetHeight = \(targetHeight), " +
            "targetX = \(targetX), targetY = \(targetY)")
        
        targetView = NSView(frame: NSRect(x: targetX, y: targetY, width: targetWidth, height: targetHeight))
        targetView!.wantsLayer = true
        targetView!.layer?.backgroundColor = NSColor.red.cgColor
        
        targetGridView.addSubview(targetView!)
    }

}
