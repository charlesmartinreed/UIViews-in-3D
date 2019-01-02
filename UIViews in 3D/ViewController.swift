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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        view.backgroundColor = .black
        
        //creating our cube, face by face
        let cube = CATransformLayer()
        
        //front face
        let transform1 = CATransform3DMakeTranslation(0, 0, 50)
        cube.addSublayer(face(with: transform1, color: .red))
        
        //create the right-hand face
        var transform2 = CATransform3DMakeTranslation(50, 0, 0)
        transform2 = CATransform3DRotate(transform2, CGFloat.pi / 2, 0, 1, 0)
        cube.addSublayer(face(with: transform2, color: .yellow))
        
        //create the top face
        var transform3 = CATransform3DMakeTranslation(0, -50, 0)
        transform3 = CATransform3DRotate(transform3, CGFloat.pi / 2, 1, 0, 0)
        cube.addSublayer(face(with: transform3, color: .green))
        
        //create the bottom face
        var transform4 = CATransform3DMakeTranslation(0, 50, 0)
        transform4 = CATransform3DRotate(transform4, -(CGFloat.pi / 2), 1, 0, 0)
        cube.addSublayer(face(with: transform4, color: .white))
        
        //create the left-hand face
        var transform5 = CATransform3DMakeTranslation(-50, 0, 0)
        transform5 = CATransform3DRotate(transform5, -(CGFloat.pi / 2), 0, 1, 0)
        cube.addSublayer(face(with: transform5, color: .cyan))
        
        var transform6 = CATransform3DMakeTranslation(0, 0, -50)
        transform6 = CATransform3DRotate(transform6, CGFloat.pi, 0, 1, 0)
        cube.addSublayer(face(with: transform6, color: .magenta))
        
        // position the cube transform layer in the center
        cube.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        
        //add the cube to the view's layers
        view.layer.addSublayer(cube)
        
        //now let's animate the cube!
        rotate(layer: cube)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK:- transformation methods
    
    func face(with transform: CATransform3D, color: UIColor) -> CALayer {
        //this method is responsible for creating a single face of the cube
        let face = CALayer()
        
        face.frame = CGRect(x: -50, y: -50, width: 100, height: 100)
        face.backgroundColor = color.cgColor
        face.transform = transform
        
        return face
    }
    
    //MARK:- animation methods
    func rotate(layer: CATransformLayer) {
        let anim = CABasicAnimation(keyPath: "transform")
        
        anim.fromValue = layer.transform
        anim.toValue = CATransform3DMakeRotation(CGFloat.pi, 1, 1, 1)
        anim.duration = 2
        anim.isCumulative = true //keep the cube rotating indefinitely by allowing one animation cycles last value to persistent into the next cycle
        anim.repeatCount = .greatestFiniteMagnitude
        layer.add(anim, forKey: "transform")
    }


}

