//
//  SceneDelegate.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 22/12/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.rootViewController = SplashScreenRouter.createModule()
        window?.makeKeyAndVisible()
        
        NotificationCenter.default
            .addObserver(
                self,
                selector: #selector(authStatusListener),
                name: .authStatus,
                object: nil
            )
        
        //Bootup process
        TXCoreModules.shared.bootUp()

//        NotificationCenter.default
//            .addObserver(
//                self,
//                selector: #selector(themeChangeListener),
//                name: .themeChange,
//                object: nil
//            )
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        
        //Bootdown process
        TXCoreModules.shared.bootDown()
        
        NotificationCenter.default.removeObserver(self)
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

    @objc private func authStatusListener(){
        guard let window = self.window else {return}
        
        let isAuthenticated = TXAuth.shared.isAuthenticated
        
        if (isAuthenticated){
            window.rootViewController = BottomTabRouter.createModule()
        }else {
            window.rootViewController = TXNavigationController(
                rootViewController: LoginRouter.createModule()
            )
        }
        
        //animation
        UIView.transition(
            with: window,
            duration: 0.8,
            options: [.curveEaseIn],
            animations: nil
        )
    }
    
//    @objc private func themeChangeListener(){
//        for view in window!.subviews {
//            view.removeFromSuperview()
//            window?.addSubview(view)
//        }
//    }
}

