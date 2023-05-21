//
//  Classifier.swift
//  cloneML
//
//  Created by Antonio Lahoz on 21/05/23.
//

import CoreML
import Vision
import CoreImage

struct Classifier {
    
    
    private(set) var results: String?
        
    //function detect: when a CIImage is feed into the detect function, we will set our property results as the most likely classification results
        mutating func detect(ciImage: CIImage) {
            
            guard let model = try? VNCoreMLModel(for: MobileNetV2(configuration: MLModelConfiguration()).model)
            else {
                return
            }
            
            let request = VNCoreMLRequest(model: model)
            
            let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
            
            try? handler.perform([request])
            
            guard let results = request.results as? [VNClassificationObservation] else {
                return
            }
            
            if let firstResult = results.first {
                self.results = firstResult.identifier
            }
            
        }
}
