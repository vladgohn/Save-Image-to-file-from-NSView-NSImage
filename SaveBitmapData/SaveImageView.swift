//
//  SaveImageView.swift
//  SaveBitmapData
//
//  Created by vladgohn on 7/24/18.
//  Copyright © 2018 vladgohn. All rights reserved.
//

import Cocoa

class SaveImageView: NSImageView {
    
    var dragImage: NSImage?
    var scanImage: NSImage?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.dragImage = NSImage(named: NSImage.Name(rawValue: "monkey"))!
        self.dragImage?.size = frame.size
        self.scanImage?.size = frame.size
        
        self.wantsLayer = true
        
        self.layer?.borderColor = CGColor(red: 0, green: 0.7, blue: 1, alpha: 0.8)
        self.layer?.borderWidth = 2

    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
//        NSColor.clear.set()
//        __NSRectFill(dirtyRect)
//        dragImage?.draw(in: dirtyRect)
//        scanImage?.lockFocus()
        dragImage?.draw(in: dirtyRect, from: NSZeroRect, operation: .sourceOver, fraction: 1.0)
//        scanImage?.unlockFocus()
//        scanImage?.draw(in: dirtyRect)
    }
    

    // EXPORT PROTOCALL
    func exportProtocall() {
        needsDisplay = true
        
        
        //SAVE PATH LOCATION
        let iconURL = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask).first!
            .appendingPathComponent("xxx").appendingPathExtension("png")
        
        print("iconURL", iconURL)
        
        let cgImage = dragImage?.cgImage(forProposedRect: nil, context: nil, hints: nil)!
        let bitmapRep = NSBitmapImageRep(cgImage: cgImage!)
            let picData = bitmapRep.representation(using: NSBitmapImageRep.FileType.png, properties: [:])
            do {
                try picData?.write(to: iconURL, options: Data.WritingOptions.atomic)
            }   catch  {
                // Catch exception here and act accordingly
            }
    }

    
}
