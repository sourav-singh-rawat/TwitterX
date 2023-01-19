//
//  ExploreViewController.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import UIKit

class ExploreViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterExploreProtocol?
    
}

extension ExploreViewController: PresenterToViewExploreProtocol{
    // TODO: Implement View Output Methods
}
