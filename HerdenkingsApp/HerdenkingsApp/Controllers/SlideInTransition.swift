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
    var containerControllerDelegate: ContainerControllerDelegate? 
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from) else {
                return
        }
        
        let containerView = transitionContext.containerView
        let button = UIButton(type: UIButtonType.custom)
        
        let finalWidth = toViewController.view.bounds.width * 0.7
        let finalHeight = toViewController.view.bounds.height
        
        if(!showingSideMenu){
            dimmingView.backgroundColor = .black
            dimmingView.alpha = 0.0
        
            containerView.addSubview(dimmingView)
            dimmingView.frame = containerView.bounds
            containerView.addSubview(toViewController.view)

            button.frame = CGRect(x: 0, y: 0, width: toViewController.view.bounds.width * 0.3, height: toViewController.view.bounds.height)
            button.addTarget(self, action: #selector(ButtonPressed(_:)), for: .touchUpInside)

            containerView.addSubview(button)
            
            toViewController.view.frame = CGRect(x: toViewController.view.bounds.width , y: 0, width: finalWidth, height: finalHeight)
        }
        
        
        
        let transform = {
            self.dimmingView.alpha = 0.6
           toViewController.view.transform = CGAffineTransform(translationX: -finalWidth, y: 0)
            button.isHidden = false
            showingSideMenu = true
        }
        
        let identity = {
            self.dimmingView.alpha = 0.0
            fromViewController.view.transform = .identity
            button.isHidden = true
            showingSideMenu = false
            
        }
        
        let duration = transitionDuration(using: transitionContext)
        let isCancelled = transitionContext.transitionWasCancelled
        UIView.animate(withDuration: duration, animations: {
            !showingSideMenu ? transform() : identity()
        }) { (_) in
            transitionContext.completeTransition(!isCancelled)
        }
        
    }
    
    @objc func ButtonPressed(_ sender: UIButton){
        containerControllerDelegate?.HideDetailPage()
    }

}
