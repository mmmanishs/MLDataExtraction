//
//  AppDelegate.swift
//  MLDataExtraction
//
//  Created by Manish Singh on 9/16/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSTextFieldDelegate {
    
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var inputFolderTextField: NSTextField!
    @IBOutlet weak var outputFolderTextField: NSTextField!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }
    
    @IBAction func startButtonClicked(_ sender: Any) {
        // Start off things here. Good luck & godspeed
        guard let moviePathCommaSeperated = inputFolderTextField.cell?.title,
            let outputPath = outputFolderTextField.cell?.title else {
                return
        }
        let moviePaths = moviePathCommaSeperated.components(separatedBy: ", ")
        
        let appArgument = AppArgument(appPath: ProcessInfo().arguments[0],
                                      tempPath: FileManager.default
                                        .temporaryDirectory.absoluteString.removeURLCrumbs
                                        .append(filePath: "my_temp_folder"),
                                      moviePath: moviePaths,
                                      outputPath: outputPath)
        startExtraction(with: appArgument)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Probably can delete stuff here
    }
}

