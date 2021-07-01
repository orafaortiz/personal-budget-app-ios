//
//  TabThreeController.swift
//  Rafa's Budget
//
//  Created by Rafael Ortiz on 28/06/21.
//

import UIKit
import LBTATools

class TabThreeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        configureNavigationBar(
            largeTitleColor: .white, backgoundColor: UIColor(named: "Orange")!,
            tintColor: .green, title: "Registrar", preferredLargeTitle: true)
    }
}
