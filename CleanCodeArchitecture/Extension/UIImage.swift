//
//  UIImage.swift
//  CleanCodeArchitecture
//
//  Created by Vicky Irwanto on 29/02/24.
//

import Foundation
import UIKit
import SDWebImage
import SDWebImageSwiftUI

extension UIImageView {
    public func maskImageCircle() {
        self.contentMode = UIView.ContentMode.scaleAspectFill
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = false
        self.clipsToBounds = true
        
        // make square(* must to make circle),
        // resize(reduce the kilobyte) and
        // fix rotation.
//        self.image = image
    }
    
    func loadImageFromUrl(from url: URL){
//        // Manual Version
//        DispatchQueue.global().async {[weak self] in
//            if let dataImage = try? Data(contentsOf: url) {
//                if let image = UIImage(data: dataImage) {
//                    DispatchQueue.main.async {
//                        let finalImage = image.makeCircular()
//                        self?.image = finalImage
//                    }
//                }
//            }
//        }
        
        // Using SDWebImage to load and process the image
        DispatchQueue.global().async {[weak self] in
            // SDWebImage provides a method to download and cache images
            SDWebImageDownloader.shared.downloadImage(with: url, options: [], progress: nil) { (image, _, error, _) in
                if let error = error {
                    print("Error downloading image: \(error)")
                    return
                }
                
                if let image = image {
                    // Process the image to make it circular
                    let finalImage = image.makeCircular()
                    
                    DispatchQueue.main.async {
                        self?.image = finalImage
                    }
                }
            }
        }

        
    }
}

extension UIImage {
    func makeCircular() -> UIImage? {
        let originalImage = self
        let imageSize = originalImage.size
        let imageRef = originalImage.cgImage
        
        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        
        // Create a circular clipping path
        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))
        context?.addPath(path.cgPath)
        
        // Clip to the circular path
        context?.clip()
        
        // Draw the image in the clipping path
        UIImage(cgImage: imageRef!).draw(in: CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))
        
        // Create the circular image
        let circularImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return circularImage
    }
}
