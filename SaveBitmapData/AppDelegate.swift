//
//  AppDelegate.swift
//  SaveBitmapData
//
//  Created by vladgohn on 7/24/18.
//  Copyright © 2018 vladgohn. All rights reserved.
//

import Cocoa


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var saveImageView: SaveImageView!
    var rippleFx = NSSound(named: NSSound.Name(rawValue: "ripple"))

    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        saveImageView.image = NSImage(named: NSImage.Name(rawValue: "monkey"))
    }


    @IBAction func buttonSave(_ sender: Any) {
        saveImageView.exportProtocall()
        rippleFx?.play()
        
    }
}


