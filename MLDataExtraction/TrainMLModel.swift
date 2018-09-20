//
//  TrainMLModel.swift
//  ExtractFaces
//
//  Created by Manish Singh on 9/16/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import CreateML
import Foundation

class TrainMLModel {
    let trainingDirectory: String
    
    init(trainingDirectory: String) {
        self.trainingDirectory = trainingDirectory
    }
    
    func train(completion: (MLImageClassifier?) ->()) {
        let trainingDir = URL(fileURLWithPath: trainingDirectory)
        
        // Add testing of files also
        //let testingDir = URL(fileURLWithPath: "testPa")
        completion(try? MLImageClassifier(trainingData: .labeledDirectories(at: trainingDir)))
        //let evalution = model.evaluation(on: .labeledDirectories(at: testingDir))
    }
}
