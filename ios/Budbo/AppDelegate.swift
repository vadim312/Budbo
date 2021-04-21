//
//  AppDelegate.swift
//  Budbo
//
//  Created by mobile-dev on 17/03/2020.
//  Copyright © 2020 Facebook. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, RCTBridgeDelegate {
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      
    guard let bridge = RCTBridge(delegate: self, launchOptions: launchOptions) else {
      return true
    }
    
    let rootView = RCTRootView(bridge: bridge, moduleName: "Budbo", initialProperties: nil)
    rootView.backgroundColor = #colorLiteral(red: 0.1921981573, green: 0.2371536493, blue: 0.3624983132, alpha: 1)
    
    self.window = UIWindow(frame: UIScreen.main.bounds)
    let rootViewController = UIViewController()
    rootViewController.view = rootView
    self.window?.rootViewController = rootViewController
    self.window?.makeKeyAndVisible()
    
    showSplash()
    
    return true
  }
  
  func showSplash() {
    let splashVC = SplashViewController(nibName: "SplashViewController", bundle: nil)
    splashVC.modalPresentationStyle = .fullScreen
    self.window?.rootViewController?.present(splashVC, animated: false, completion: nil)
  }
  
  func sourceURL(for bridge: RCTBridge!) -> URL! {
#if DEBUG
    return RCTBundleURLProvider.sharedSettings()?.jsBundleURL(forBundleRoot: "index", fallbackResource: nil)
#else
    return Bundle.main.url(forResource: "main", withExtension: "jsbundle")
#endif
  }
}
