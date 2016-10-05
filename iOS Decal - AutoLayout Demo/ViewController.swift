//
//  ViewController.swift
//  iOS Decal - AutoLayout Demo
//
//  Created by Paige Plander on 10/5/16.
//  Copyright © 2016 Paige Plander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /// The button at the top of our stack view
    var button = UIButton(type: .roundedRect)
    
    /// The label that is hidden/unhidden by the button
    var label = UILabel()
    
    /// UI constants used in the view (by defining them up here, it is
    /// easier to tweak UI elements)
    enum Constants {
        
        /// Button Constants
        static let ButtonColor: UIColor = UIColor.white
        static let BackgroundColor: UIColor = UIColor.black
        static let ButtonFont: UIFont = UIFont.boldSystemFont(ofSize: 50)
        
        /// Label Constants
        static let LabelColor: UIColor = UIColor.yellow
        static let LabelText: String = "Hidden Label "
        
        /// Stack View Constants (try tweaking them!)
        static let StackviewSpacing: CGFloat = 20
        static let StackViewAxis: UILayoutConstraintAxis = .vertical
        static let StackViewDistribution: UIStackViewDistribution = .fillEqually
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// set up UI for the view
        view.backgroundColor = Constants.BackgroundColor
        
        /// set up UI for button
        button.setTitle("Button!", for: .normal)
        button.titleLabel?.font = Constants.ButtonFont
        button.backgroundColor = UIColor.white
        
        /// add a target to the button (when this button is tapped, calls the method named "hideLabel")
        button.addTarget(self, action: #selector(hideLabel), for: UIControlEvents.touchUpInside)
        
        /// set up UI for label
        label.textAlignment = .center
        label.text = Constants.LabelText
        label.backgroundColor = Constants.LabelColor
        /// Hides the UI Label (still exists in memory, just becomes unseen in the view)
        label.isHidden = true
        
        /// create a stack view that holds the button and the label
        let stackView = UIStackView(arrangedSubviews: [button, label])
        stackView.spacing = Constants.StackviewSpacing
        stackView.axis = Constants.StackViewAxis
        stackView.distribution = Constants.StackViewDistribution
        
        /// add the stack view to our superview (view = self.view)
        view.addSubview(stackView)
        
        /// set up the constraints for our stack view
        pin(view: stackView, toAllSidesOfView: self.view, margin: 40)
    }
    
    /// Toggles the hidden property for the label when
    /// the sender is pressed
    ///
    /// - parameter sender: The button that was pressed
    func hideLabel(sender: UIButton) {
        /// Animates the hiding of the view
        UIView.animate(withDuration: 1, animations: {
            self.label.isHidden = !self.label.isHidden
        })
        
        /* If we did not want to animate the view, this method would simply be
        
         label.isHidden = !label.isHidden
         
        */
    }
    
    /// Pins the view to all edges of the superview using NSLayoutAnchors
    ///
    /// - parameter view:      The view we want to pin
    /// - parameter superview: The superview of the view
    /// - parameter margin:    The margin we want between the view and its superview
    func pin(view: UIView, toAllSidesOfView superview: UIView, margin: CGFloat) {
        
        /// Set to false since we are using AutoLayout
        view.translatesAutoresizingMaskIntoConstraints = false
        
        /// Set this view's leading anchor equal to its superview's leading anchor (+ margin)
        view.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: margin).isActive = true
        
        /// Set this view's trailing anchor equal to its superview's trailing anchor (+ margin)
        view.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -margin).isActive = true
        
        /// Set this view's top anchor equal to its superview's top anchor (- margin)
        view.topAnchor.constraint(equalTo: superview.topAnchor, constant: margin).isActive = true
        
        /// Set this view's bottom anchor equal to its superview's bottom anchor (- margin)
        view.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -margin).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

