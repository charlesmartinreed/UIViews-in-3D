//
//  ViewController.swift
//  UIViews in 3D
//
//  Created by Charles Martin Reed on 1/1/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK:- Properties
    //we'll be rendering this image view in 3D space, we need a strong reference to it to keep it alive through the lifetime of the app
    let imageView = UIImageView(frame: CGRect(x: -150, y: -150, width: 300, height: 300))
    let perspectiveShift: CGFloat = -1 / 500
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        view.backgroundColor = .black
        
        //load an image into the imageView
        imageView.image = UIImage(named: "flowers")
        imageView.contentMode = .scaleAspectFit
        
        //create the transform layer
        let transformLayer = CATransformLayer()
        var perspective = CATransform3DIdentity //gives us a 4x4 matrix
        
        perspective.m34 = perspectiveShift
        transformLayer.transform = perspective
        
        //to make the 3D effect work correctly in this use case, we need our transformLayer to be centered on the screen
        transformLayer.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        
        //add the image view layer to the transform layer, and the transform layer to the main view itself
        transformLayer.addSublayer(imageView.layer)
        view.layer.addSublayer(transformLayer)
        
        //a simple a rotation transform for our image - not using this one!
        //imageView.layer.transform = CATransform3DMakeRotation(-0.5, 1, 0, 0)
        
        //animation #1: rocking back and forth, along the x axis
        make3DAnimation(layer: imageView.layer)
    }
    
    //MARK:- Layer animations
    fileprivate func make3DAnimation(layer: CALayer) {
        let anim = CABasicAnimation(keyPath: "transform")
        anim.fromValue = CATransform3DMakeRotation(0.5, 1, 0, 0)
        anim.toValue = CATransform3DMakeRotation(-0.5, 1, 0, 0)
        anim.duration = 1
        anim.autoreverses = true
        anim.repeatCount = 10
        layer.add(anim, forKey: "transform")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


}

