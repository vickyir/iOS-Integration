//
//  LoadingView.swift
//  CleanCodeArchitecture
//
//  Created by Vicky Irwanto on 02/03/24.
//

import Foundation
import UIKit

public class LoadingOverlay {
    
    var overlayView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    var loadingTextLabel = UILabel()
    
    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }
    
    public func showOverlay(view: UIView, loadingText: String = "") {
        overlayView.frame = view.frame
        overlayView.center = view.center
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        overlayView.clipsToBounds = true
        overlayView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.style = .whiteLarge
        activityIndicator.center = CGPoint(x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2)
        
        loadingTextLabel.frame = CGRect(x: 0, y: activityIndicator.frame.maxY + 10, width: overlayView.bounds.width, height: 30)
        loadingTextLabel.textColor = .white
        loadingTextLabel.textAlignment = .center
        loadingTextLabel.text = loadingText
        loadingTextLabel.numberOfLines = 0
        
        overlayView.addSubview(activityIndicator)
        overlayView.addSubview(loadingTextLabel)
        
        view.addSubview(overlayView)
        
        activityIndicator.startAnimating()
    }
    
    public func hideOverlayView() {
        activityIndicator.stopAnimating()
        overlayView.removeFromSuperview()
    }
}
