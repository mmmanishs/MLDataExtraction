//
//  AppArgument.swift
//  ExtractFaces
//
//  Created by Manish Singh on 9/16/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation

struct AppArgument {
    let appPath: String
    let tempPath: String // This can be the temp directory for the system. Need to store temp files
    let moviePath: [String] // Have the movie files here
    let outputPath: String
    
    init(appPath: String, tempPath: String, moviePath: [String], outputPath: String) {
        self.appPath = appPath
        self.tempPath = tempPath
        self.moviePath = moviePath
        self.outputPath = outputPath
    }
}

//extension AppArgument {
//    init?(processInfo: [String]) {
//        guard processInfo.count >= 3 else {
//            return nil
//        }
//        var arguments = processInfo
//        appPath = arguments.removeFirst()
//        tempPath = FileManager.default.temporaryDirectory.absoluteString.removeURLCrumbs.append(filePath: "my_temp_dir")
//        outputPath = arguments.removeLast()
//        
//        // Now the rest all are movie paths. So lets get to it
//        moviePath = arguments
//    }
//}
