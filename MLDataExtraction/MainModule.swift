//
//  main.swift
//  ExtractFaces
//
//  Created by Manish Singh on 9/13/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation
import Vision
import AppKit

func startExtraction(with appArgument: AppArgument) {
    // Delete and create the temp directory
    appArgument.tempPath.delete()
    appArgument.tempPath.makeDirectory()
    
    let scriptOutputFolder = appArgument.tempPath.append(filePath: "SplitImagesFromVideos")
    scriptOutputFolder.makeDirectory()
    
    // Split movie into images
    let scriptPath = appArgument.appPath._cd__()._cd__().append(filePath: "Resources") + "/split.sh"
    startImageSplit(scriptPath: scriptPath, outputFolder: scriptOutputFolder, inputMovies: appArgument.moviePath)
    
    let faceCropOutputFolder = appArgument.tempPath.append(filePath: "FaceCroppedFromImages")
    faceCropOutputFolder.makeDirectory()
    // Extract face out of images
    startExtractImageProcess(inputDir: scriptOutputFolder, outputDir: faceCropOutputFolder)
    
    
    // Now delete the images which we got from the movies
    scriptOutputFolder.delete()
    
    let modelTrain = TrainMLModel(trainingDirectory: faceCropOutputFolder)
    modelTrain.train() { model in
        guard let model = model else {
            return
        }
        appArgument.outputPath.makeDirectory()
        try? model.write(toFile: appArgument.outputPath)
    }
}
