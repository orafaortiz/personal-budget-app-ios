//
//  ViewController.swift
//  Rafa's Budget
//
//  Created by Rafael Ortiz on 27/06/21.
//

import UIKit
import LBTATools

class ViewController: LBTAFormController {
    
    let registerButton = UIButton(title: "Register", titleColor: UIColor(named: "AntiqueWhite") ?? .white, font: .boldSystemFont(ofSize: 16), backgroundColor: UIColor(named: "Orange")!, target: self, action: #selector(signUp))
    
    let loginButton = UIButton(title: "Login", titleColor: UIColor(named: "AntiqueWhite") ?? .white, font: .boldSystemFont(ofSize: 16), backgroundColor: UIColor(named: "Green")!, target: self, action: #selector(signIn))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.alwaysBounceVertical = true
        
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        formContainerStackView.axis = .vertical
        formContainerStackView.spacing = 16
        formContainerStackView.layoutMargins = .init(top: 0, left: 24, bottom: 12, right: 24)
        
        // email input field
        let emailField = UITextField().forBlackBackground(placeholderText: "Email", keyboard: .emailAddress)
        formContainerStackView.addArrangedSubview(emailField)
        
        // password input field
        let passwordField = UITextField().forBlackBackground(placeholderText: "Password")
       formContainerStackView.addArrangedSubview(passwordField)
        
        loginButton.constrainHeight(50)
        loginButton.layer.cornerRadius = 5
        
        registerButton.constrainHeight(50)
        registerButton.layer.cornerRadius = 5
        
        formContainerStackView.addArrangedSubview(loginButton)
        
        let divider = UIView(backgroundColor: .white).withHeight(1)
        
        formContainerStackView.addArrangedSubview(divider)
        
        let orText = UILabel(text: "Or create your account", font: .boldSystemFont(ofSize: 14), textColor: UIColor(named: "AntiqueWhite") ?? .white, textAlignment: .left, numberOfLines: 1)
        
//        let registerBox = UIView().hstack(orText, registerButton.withWidth(200), spacing: 12, alignment: .fill)
//        formContainerStackView.addArrangedSubview(registerBox)
        
        formContainerStackView.addArrangedSubview(orText)
        formContainerStackView.addArrangedSubview(registerButton)
        
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        button.center = view.center
//    }
    
    @objc func signIn() {
        configUINavigation()
    }
    
    @objc func signUp() {
        
    }
    
    private func configUINavigation() {
        let tabBarVC = UITabBarController()
        
        let tab1 = UINavigationController(rootViewController: TabOneController())
        let tab2 = UINavigationController(rootViewController: TabTwoController())
        let tab3 = UINavigationController(rootViewController: TabThreeController())
        
        tabBarVC.setViewControllers([tab1, tab2, tab3], animated: false)
        
        tab1.tabBarItem.image = UIImage(named: "com-dinheiro")
        tab1.tabBarItem.selectedImage = UIImage(named: "com-dinheiro-red")
        
        tab2.tabBarItem.image = UIImage(named: "gestao")
        tab2.tabBarItem.selectedImage = UIImage(named: "gestao-red")
        
        tab3.tabBarItem.image = UIImage(named: "crescimento-pessoal")
        tab3.tabBarItem.selectedImage = UIImage(named: "crescimento-pessoal-red")
        
        guard let items = tabBarVC.tabBar.items else { return }
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 15, left: 5, bottom: 0, right: 5)
        }
        
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.tabBar.isTranslucent = false
        tabBarVC.tabBar.barTintColor = UIColor(named: "AntiqueWhite")
        present(tabBarVC, animated: true)
    }
    
}

extension UIViewController {
    
    func configureNavigationBar(largeTitleColor: UIColor, backgoundColor: UIColor, tintColor: UIColor, title: String, preferredLargeTitle: Bool) {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: largeTitleColor]
            navBarAppearance.titleTextAttributes = [.foregroundColor: largeTitleColor]
            navBarAppearance.backgroundColor = backgoundColor

            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.compactAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance

            navigationController?.navigationBar.prefersLargeTitles = preferredLargeTitle
            navigationController?.navigationBar.isTranslucent = false
            navigationController?.navigationBar.tintColor = tintColor
            navigationItem.title = title

        } else {
            // Fallback on earlier versions
            navigationController?.navigationBar.prefersLargeTitles = preferredLargeTitle
            navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: largeTitleColor]
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: largeTitleColor]
            navigationController?.navigationBar.barTintColor = backgoundColor
            navigationController?.navigationBar.isTranslucent = false
            navigationItem.title = title
        }
        
        navigationController?.navigationBar.setupShadow(
            opacity: 0.5,
            radius: 10,
            offset: CGSize(width: 0, height: 10),
            color: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.3)
        )
    }
}

