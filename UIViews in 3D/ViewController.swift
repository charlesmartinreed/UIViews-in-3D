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
    var openingCrawl: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        view.backgroundColor = .black
        
        //attributed strings for the crawl styling, title and text
//        let titleParagraphStyle = NSMutableParagraphStyle()
//        titleParagraphStyle.alignment = .center
//
//        let textParagraphStyle = NSMutableParagraphStyle()
//        textParagraphStyle.alignment = .justified
//
//        let titleAttributes = [
//            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 32),
//            NSAttributedString.Key.paragraphStyle: titleParagraphStyle
//        ]
//        let textAttributes = [
//            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22),
//            NSAttributedString.Key.paragraphStyle: textParagraphStyle
//        ]
        
        let title = "EPISODE LLVM\nSWIFT EVOLUTION\n"
        let body = "It is a period of civil war. People BIKESHED proposals while Swift itself still hasn't finished compiling code written during the OLD REPUBLIC.\n\nXCODE crashes faster than a speeder bike on Endor, but undeterred Apple unleashed a new wave of Auto Layout problems with THE NOTCH.\n\nMeanwhile, the GALACTIC EMPI — er, GOOGLE — are building an army of clones using Java Kotlin Flutter. Now all hopes for the REBEL ALLIANCE lie with Swift's developers, who must add features, fix bugs, and, most importantly, prepare t— ERROR Assertion failed: (hasInterfaceType() && \"No interface type was set\"), function getInterfaceType, file /Users/Crusty/workspace/swift/AST/Decl.cpp line 1977."
        
        makeAttributedText(title: title, body: body)
        //let title = NSMutableAttributedString(string: "EPISODE LLVM\nSWIFT EVOLUTION\n", attributes: titleAttributes)
        //let text = NSAttributedString(string: mainText, attributes: textAttributes)
        //title.append(text)
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    fileprivate func makeAttributedText(title: String, body: String) {
        //attributed strings for the crawl styling, title and text
        let titleParagraphStyle = NSMutableParagraphStyle()
        titleParagraphStyle.alignment = .center
        
        let textParagraphStyle = NSMutableParagraphStyle()
        textParagraphStyle.alignment = .justified
        
        let titleAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 32),
            NSAttributedString.Key.paragraphStyle: titleParagraphStyle
        ]
        let bodyAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22),
            NSAttributedString.Key.paragraphStyle: textParagraphStyle
        ]
        
        let scrollTitle = NSMutableAttributedString(string: title, attributes: titleAttributes)
        let scrollBody = NSAttributedString(string: body, attributes: bodyAttributes)
        scrollTitle.append(scrollBody)
        
        makeCrawlLabelFromMutableAttributedText(scrollable: scrollTitle)
    }
    
    fileprivate func makeCrawlLabelFromMutableAttributedText(scrollable: NSMutableAttributedString) {
        openingCrawl = UILabel()
        openingCrawl.translatesAutoresizingMaskIntoConstraints = false
        openingCrawl.attributedText = scrollable
        openingCrawl.textColor = UIColor(red: 250/255.0, green: 226/255.0, blue: 83/255.0, alpha: 1)
        openingCrawl.numberOfLines = 0
        
        //label should fit the screen, with minimum space at the edges
        let labelSize = openingCrawl.sizeThatFits(CGSize(width: view.bounds.width - 20, height: CGFloat.greatestFiniteMagnitude))
        openingCrawl.frame = CGRect(x: 10 - (view.bounds.width / 2), y: 0, width: labelSize.width, height: labelSize.height)
        
        let layer = CATransformLayer()
        layer.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        
        var perspective = CATransform3DIdentity
        perspective.m34 = -1 / 250
        layer.transform = perspective
        
        layer.addSublayer(openingCrawl.layer)
        view.layer.addSublayer(layer)
        
        //rotating then translating != translating then rotating
        let crawlTransformStart = CATransform3DMakeRotation(0.5, 1, 0, 0)
        openingCrawl.layer.transform = CATransform3DTranslate(crawlTransformStart, 0, 400, 0)
        
        animateUpIntoVanishingPoint(layer: openingCrawl.layer)
        
    }
    
    //MARK:- transformation methods
    func animateUpIntoVanishingPoint(layer: CALayer) {
        let anim = CABasicAnimation(keyPath: "transform")
        anim.fromValue = layer.transform
        
        let crawlTransformEnd = CATransform3DMakeRotation(0.5, 1, 0, 0)
        anim.toValue = CATransform3DTranslate(crawlTransformEnd, 0, -500, 0)
        
        anim.duration = 90
        layer.add(anim, forKey: "tranform")
    }
    
    
    
    //MARK:- animation methods


}

