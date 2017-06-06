//
//  ViewController.swift
//  Server
//
//  Created by DLL on 17/5/18.
//  Copyright © 2017年 DLL. All rights reserved.
//

import Cocoa
// MARK:- banben ceshi
class ViewController: NSViewController {

    @IBOutlet weak var hintLabel: NSTextField!
    override func viewDidLoad() {
        fileprivate let server = ServerManager()
        super.viewDidLoad()
 
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func startRunning(_ sender: NSButton) {
        server.startRunning()
        hintLabel.stringValue = "服务器已开启"
    }
    @IBAction func stopRunning(_ sender: NSButton) {
        servent
        hintLabel.stringValue = "服务器已关闭"
    }

}

