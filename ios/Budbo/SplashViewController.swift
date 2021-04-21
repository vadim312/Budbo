//
//  SplashViewController.swift
//  Budbo
//
//  Created by mobile-dev on 17/03/2020.
//  Copyright © 2020 Facebook. All rights reserved.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()

        startAnimation()
    }
    
    func startAnimation() {
      let animationView = AnimationView()
      animationView.frame = CGRect(origin: .zero, size: UIScreen.main.bounds.size)
      animationView.animation = Animation.named("splash")
      self.view.addSubview(animationView)
      
      animationView.play { (_) in
        self.dismiss(animated: false, completion: nil)
      }
    }
}
