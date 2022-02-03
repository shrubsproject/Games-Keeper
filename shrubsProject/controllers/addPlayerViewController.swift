//
//  addPlayerViewController.swift
//  shrubsProject
//
//  Created by Ilya Egorov on 02.01.2022.
//

import UIKit

final class addPlayerViewController: UIViewController {
    
    let headerLabel: UILabel = UILabel()
    var viewModel: addPlayerViewModel!
    let textField: playerTextField = playerTextField(frame: .zero)
    var additioHandler: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        neprostoUI()
        configuredLayout()
        configuredViewModel()
        textField.addTarget(self, action: #selector(enableButton), for: .editingChanged)
    }
    
    func neprostoUI(){
        
        textField.layer.cornerRadius = 0
        
        view.addSubview(headerLabel)
        view.addSubview(textField)
        
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goBack))
        navigationItem.backBarButtonItem = nil
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(plusPlayer))
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        view.backgroundColor = UIColor(named: "Color-3")
        
        headerLabel.font = UIFont(name: "Charter", size: 36)
        headerLabel.text = "Add player"
        headerLabel.textColor = UIColor.white
        
        textField.tintColor = .white
        textField.font = UIFont(name: "Charter", size: 20)
        textField.attributedPlaceholder = NSAttributedString(string: "Player name", attributes: [.foregroundColor: UIColor.lightGray])
        textField.backgroundColor = UIColor(named: "Color-1")
        textField.textColor = UIColor.white
    }
    
    func configuredLayout() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constantsy.leadingHeaderLabel),
            headerLabel.heightAnchor.constraint(equalToConstant: Constantsy.heightHeaderLabel),
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            textField.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: Constantsy.topTextField),
            textField.heightAnchor.constraint(equalToConstant: Constantsy.heightTextField),
            textField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)])
    }
    
    @objc func goBack(){
        viewModel.goBack()
    }
    
    @objc func plusPlayer(){
        if let text = textField.text{
            viewModel.plusPlayer(name: text)
        }
    }
    
    func configuredViewModel(){
        viewModel.onAlert = { [unowned self] alert in
            let alertController = UIAlertController(title: "attention!", message: alert, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "ok", style: .destructive, handler: nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @objc func enableButton(){
        navigationItem.rightBarButtonItem?.isEnabled = !(textField.text?.isEmpty ?? true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textField.becomeFirstResponder()
    }
    
}

extension addPlayerViewController{
    enum Constantsy{
        static let leadingHeaderLabel: CGFloat = 20.0
        static let heightHeaderLabel: CGFloat = 42.0
        static let heightTextField: CGFloat = 60.0
        static let topTextField: CGFloat = 5.0
    }
}
