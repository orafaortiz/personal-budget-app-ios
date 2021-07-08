//
//  TabTwoController.swift
//  Rafa's Budget
//
//  Created by Rafael Ortiz on 28/06/21.
//

import UIKit
import LBTATools

class TabTwoController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        configureNavigationBar(
            largeTitleColor: .white, backgoundColor: UIColor(named: "Brown")!,
            tintColor: .green, title: "Extrato Detalhado", preferredLargeTitle: true)
    }
}
