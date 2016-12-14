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
    
    fileprivate static let delayBeforeFirstTarget: Double = 1
    fileprivate static let delayBetweenTargets: Double = 1
    
    fileprivate static let numberOfColumns: Int = 3
    fileprivate static let numberOfRows: Int = 3

    @IBOutlet weak var startButton: NSButton!
    @IBOutlet weak var targetGridView: NSView!
    @IBOutlet weak var reactionTimeLabel: NSTextField!
    @IBOutlet weak var averageReactionTimeLabel: NSTextField!
    
    fileprivate var targetView: NSView?
    /// Time when the target view was shown
    fileprivate var startTime: Date?
    fileprivate var totalReactionTime: TimeInterval = 0
    fileprivate var numberOfReactionTimes: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func startButtonClicked(_ sender: NSButton) {
        print("startButtonClicked()")
        
        // Set a timer to display a target
        _ = Timer.scheduledTimer(
                timeInterval: ViewController.delayBeforeFirstTarget,
                target: self,
                selector: #selector(displayTarget),
                userInfo: nil,
                repeats: false)
    }
    
    func displayTarget() {
        print("displayTarget()")
        
        // Randomly generate the target's position
        let targetColumn = Int(arc4random()) % 3
        let targetRow = Int(arc4random()) % 3

        let targetWidth = Int(targetGridView.frame.size.width) / ViewController.numberOfColumns
        let targetHeight = Int(targetGridView.frame.size.height) / ViewController.numberOfRows
        
        let targetX = targetColumn * targetWidth
        let targetY = targetRow * targetHeight
        
        print("targetColumn = \(targetColumn), targetRow = \(targetRow), " +
            "targetWidth = \(targetWidth), targetHeight = \(targetHeight), " +
            "targetX = \(targetX), targetY = \(targetY)")
        
        // Show the target in the grid
        targetView = NSView(frame: NSRect(x: targetX, y: targetY, width: targetWidth, height: targetHeight))
        targetView!.wantsLayer = true
        targetView!.layer?.backgroundColor = NSColor.red.cgColor
        
        targetGridView.addSubview(targetView!)
        
        // Start the reaction timer
        startTime = Date()
    }
    
    // Click events
    override func mouseDown(with event: NSEvent) {
        print("ViewController.mouseDown()")
        super.mouseDown(with: event)
        
        guard let targetView = targetView, let startTime = startTime
            else { return }
        
        // Calculate the reaction time
        let reactionTime = -(startTime.timeIntervalSinceNow)
        totalReactionTime += reactionTime
        numberOfReactionTimes += 1
        
        // Display the reaction time
        let reactionTimeString = String(format: "%.6f s", reactionTime)
        print("reactionTime = \(reactionTimeString)")
        reactionTimeLabel.stringValue = "Time: \(reactionTimeString)"
        
        // Calculate the average reaction time
        let averageReactionTime = totalReactionTime / Double(numberOfReactionTimes)
        
        // Display the average reaction time
        let averageReactionTimeString = String(format: "%.6f s", averageReactionTime)
        print("averageReactionTime = \(averageReactionTimeString)")
        averageReactionTimeLabel.stringValue = "Average: \(averageReactionTimeString)"
        
        // Remove the target and timer
        targetView.removeFromSuperview()
        self.targetView = nil
        self.startTime = nil
    }

}
