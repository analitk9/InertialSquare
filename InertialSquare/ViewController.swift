//
//  ViewController.swift
//  InertialSquare
//
//  Created by Denis Evdokimov on 11/17/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let height: CGFloat = 100
    
    private lazy var squareView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: Int(view.center.x - height/2),
                                             y: Int(view.center.y - height/2),
                                             width: Int(height),
                                             height: Int(height)))
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    private lazy var animator = UIDynamicAnimator(referenceView: view)
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(squareView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc private func handleTap(_ gesture: UITapGestureRecognizer) {
        animator.removeAllBehaviors()
        let location = gesture.location(in: view)
      
        let snap = UISnapBehavior(item: squareView, snapTo: location)
        snap.damping = 0.7

        animator.addBehavior(snap)
    }
    
}

