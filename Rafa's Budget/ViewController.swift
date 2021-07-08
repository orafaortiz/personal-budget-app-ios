//
//  ViewController.swift
//  Rafa's Budget
//
//  Created by Rafael Ortiz on 27/06/21.
//

import UIKit
import LBTATools

class ViewController: LBTAFormController {
    
    private let button: UIButton = {
       let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 52))
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = UIColor(named: "Orange")
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let registerButton = UIButton(title: "Register", titleColor: .white, font: .boldSystemFont(ofSize: 16), backgroundColor: UIColor(named: "Orange")!, target: self, action: #selector(handleCancel))
    
    let loginButton = UIButton(title: "Login", titleColor: .white, font: .boldSystemFont(ofSize: 16), backgroundColor: UIColor(named: "Green")!, target: self, action: #selector(handleCancel))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        view.addSubview(button)
//        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//        view.backgroundColor = UIColor(named: "AntiqueWhite")
        
        scrollView.alwaysBounceVertical = true
        
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        formContainerStackView.axis = .vertical
        formContainerStackView.spacing = 12
        formContainerStackView.layoutMargins = .init(top: 0, left: 24, bottom: 24, right: 12)
        
        // email input field
        let emailField = IndentedTextField(placeholder: "Email", padding: 12, cornerRadius: 5, backgroundColor: .white)
        emailField.constrainHeight(50)
        formContainerStackView.addArrangedSubview(emailField)
        
        // password input field
        let passwordField = IndentedTextField(placeholder: "Password", padding: 12, cornerRadius: 5, backgroundColor: .white)
        passwordField.constrainHeight(50)
        formContainerStackView.addArrangedSubview(passwordField)
        
        registerButton.constrainHeight(50)
        loginButton.constrainHeight(50)
        
        formContainerStackView.addArrangedSubview(registerButton)
        formContainerStackView.addArrangedSubview(loginButton)
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        button.center = view.center
//    }
    
    @objc func handleCancel() {
        
    }
    
    @objc func didTapButton() {
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

