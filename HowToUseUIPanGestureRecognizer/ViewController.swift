//
//  ViewController.swift
//  HowToUseUIPanGestureRecognizer
//
//  Created by ramil on 08/10/2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate let imageView = UIImageView(image: UIImage(named: "back"))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 360).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 275).isActive = true
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 40
        
        let card = UIView()
        imageView.addSubview(card)
        card.translatesAutoresizingMaskIntoConstraints = false
        card.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        card.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        card.heightAnchor.constraint(equalToConstant: 360).isActive = true
        card.widthAnchor.constraint(equalToConstant: 275).isActive = true
        card.backgroundColor = UIColor.lightGray.withAlphaComponent(0.77)
        
        card.isUserInteractionEnabled = false
        imageView.isUserInteractionEnabled = true
        
        imageView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture)))
    }
    
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        
        if gesture.state == .began {
            print("began")
        } else  if gesture.state == .changed {
            let translation = gesture.translation(in: self.view)
            imageView.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
        } else if gesture.state == .ended {
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.imageView.transform = .identity
            })
        }
    }

}

