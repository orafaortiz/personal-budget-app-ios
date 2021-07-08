//
//  TabOneController.swift
//  Rafa's Budget
//
//  Created by Rafael Ortiz on 28/06/21.
//

import UIKit
import LBTATools

class TabOneController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        view.backgroundColor = .white
        
    }
    
    private func setupNavigationBar() {
        configureNavigationBar(
            largeTitleColor: .white, backgoundColor: UIColor(named: "Green")!, tintColor: .green, title: "Visão Geral", preferredLargeTitle: true)
        
    }
}
