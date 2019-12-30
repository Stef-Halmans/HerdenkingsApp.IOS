//
//  SlideInTransition.swift
//  HerdenkingsApp
//
//  Created by Stef Halmans on 11/25/19.
//  Copyright © 2019 Stef Halmans. All rights reserved.
//

import UIKit

class SlideInTransition: NSObject, UIViewControllerAnimatedTransitioning {

    let dimmingView = UIView()
    var containerButtonDelegate: ContainerButtonDelegate?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from) else {
                return
        }
        
        let containerView = transitionContext.containerView
        
        let finalWidth = toViewController.view.bounds.width * 0.7
        let finalHeight = toViewController.view.bounds.height
        print("1")
        if(!showingSideMenu){
            print("2")
            dimmingView.backgroundColor = .black
            dimmingView.alpha = 0.0
        
            containerView.addSubview(dimmingView)
            dimmingView.frame = containerView.bounds

            
            
            containerView.addSubview(toViewController.view)
            
            toViewController.view.frame = CGRect(x: toViewController.view.bounds.width , y: 0, width: finalWidth, height: finalHeight)
        }
        
        let transform = {
            self.dimmingView.alpha = 0.6
           toViewController.view.transform = CGAffineTransform(translationX: -finalWidth, y: 0)
            showingSideMenu = true
            print("3")
        }
        
        let identity = {
            self.dimmingView.alpha = 0.0
            fromViewController.view.transform = .identity
            showingSideMenu = false
            print("4"
            )
        }
        
        let duration = transitionDuration(using: transitionContext)
        let isCancelled = transitionContext.transitionWasCancelled
        UIView.animate(withDuration: duration, animations: {
            !showingSideMenu ? transform() : identity()
        }) { (_) in
            transitionContext.completeTransition(!isCancelled)
        }
        
    }
    
    
}
