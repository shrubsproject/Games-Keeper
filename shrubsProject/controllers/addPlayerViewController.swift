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
        
        textField.layer.cornerRadius = 15
        
        view.addSubview(headerLabel)
        view.addSubview(textField)
        
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(goBack))
        navigationItem.backBarButtonItem = nil
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "add", style: .plain, target: self, action: #selector(plusPlayer))
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        view.backgroundColor = UIColor.white
        
        headerLabel.font = UIFont(name: "Zapf Dignbats", size: 100)
        headerLabel.text = "add player"
        headerLabel.textColor = UIColor.systemPink
        
        textField.tintColor = .white
        textField.font = UIFont(name: "Zapf Dignbats", size: 30)
        textField.attributedPlaceholder = NSAttributedString(string: "player name", attributes: [.foregroundColor: UIColor.lightGray])
        textField.backgroundColor = UIColor.gray
        textField.textColor = UIColor.green
    }
    
    func configuredLayout() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constantsy.leadingHeaderLabel),
            headerLabel.heightAnchor.constraint(equalToConstant: Constantsy.heightHeaderLabel),
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constantsy.topTextField),
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constantsy.leadingTextField),
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
        static let leadingHeaderLabel: CGFloat = 25.0
        static let leadingTextField: CGFloat = 25.0
        static let heightHeaderLabel: CGFloat = 55.0
        static let heightTextField: CGFloat = 40.0
        static let topTextField: CGFloat = 80.0
    }
}
