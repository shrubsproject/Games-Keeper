//
//  dashboardViewController.swift
//  shrubsProject
//
//  Created by Ilya Egorov on 02.01.2022.
//

import UIKit

final class dashboardViewController: UIViewController {
    
    let startGameButton: ShadowButton = ShadowButton(frame: .zero)
    let tableView: UITableView = UITableView(frame: .zero, style: .plain)
    var tableViewHeightContraint: NSLayoutConstraint!
    
    let headerLabel: UILabel = UILabel()
    var viewModel: dashboardViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prostoUI()
        configuredLayout()
        configuredViewModel()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(userCell.self, forCellReuseIdentifier: userCell.id)
    }
    
    func prostoUI() {
        
        tableView.layer.cornerRadius = 15
        
        view.addSubview(startGameButton)
        view.addSubview(tableView)
        view.addSubview(headerLabel)
        
        tableView.backgroundColor = UIColor(named: "Color-1")
        view.backgroundColor = UIColor(named: "Color-3")
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.isTranslucent = false
        
        startGameButton.titleLabel?.font = UIFont(name: "Charter", size: 24)
        startGameButton.setTitle("Start game", for: .normal)
        startGameButton.addTarget(self, action: #selector(start), for: .touchUpInside)
        
        startGameButton.isShadow = true
        startGameButton.isEnabled = false
        
        
        tableView.separatorColor = UIColor(red: 0.333, green: 0.333, blue: 0.333, alpha: 1)
        tableView.separatorStyle = .singleLine
        tableView.allowsSelection = false
        
        headerLabel.font = UIFont(name: "Charter", size: 36.0)
        headerLabel.text = "Game counter"
        headerLabel.textColor = UIColor.white
        if let rootViewController = UIApplication.shared.delegate?.window??.rootViewController, rootViewController !== navigationController
        { navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissView))
        }
        
    }
    
    @objc func dismissView(){
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func start(){
        viewModel.startGame()
    }
    
    func configuredLayout() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        startGameButton.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableViewHeightContraint = tableView.heightAnchor.constraint(equalToConstant: 110)
        NSLayoutConstraint.activate([
        
            startGameButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.startGameButtonOfSet),
            startGameButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.leadingOfSet),
            startGameButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            startGameButton.heightAnchor.constraint(equalToConstant: Constants.startButtonHeight),
            tableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: Constants.tableViewOfSet),
            tableView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.leadingOfSet), tableViewHeightContraint,
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.leadingOfSet),
            headerLabel.heightAnchor.constraint(equalToConstant: Constants.headerLabelHeight)
        ])
    }
    
   func configuredViewModel() {
       viewModel.onPlayerAdd = {[unowned self] in
           self.tableView.reloadData()
           let maxHeight = view.safeAreaLayoutGuide.layoutFrame.height - Constants.tableViewOfSetLim
           self.tableViewHeightContraint.constant = min(maxHeight, Constants.cHeight * CGFloat(viewModel.players.count + 2))
           if self.viewModel.players.count > 0 {
               self.startGameButton.isEnabled = true
           }
       }
       
       viewModel.onPlayerDelete = {[unowned self] index in
           self.tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .fade)
           let maxHeight = view.safeAreaLayoutGuide.layoutFrame.height - Constants.tableViewOfSetLim
           self.tableViewHeightContraint.constant = min(maxHeight, Constants.cHeight * CGFloat(viewModel.players.count + 2))
           if self.viewModel.players.count == 0 {
               self.startGameButton.isEnabled = false
           }
           self.tableView.reloadData()
       }
    }

}

extension dashboardViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection sectoin: Int) -> Int {
        return viewModel.players.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPatch: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: userCell.id) as! userCell

        if indexPatch.row == viewModel.players.count{
            cell.style = .add
            cell.handler = {[unowned self] in
                self.viewModel.addPlayer()
            }
        }
        else{
            cell.style = .user
            cell.textLabel?.text = viewModel.players[indexPatch.row].name
            cell.handler = { [unowned self, indexPatch] in
                self.viewModel.deletePlayer(at: indexPatch.row)
            }
        }
        cell.backgroundColor = UIColor(named: "Color-1")
        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        Constants.aHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: Constants.aHeight))
        view.backgroundColor = UIColor(named: "Color-1")
        
        let label = UILabel(frame: .zero)
        label.text = "Players"
        label.font = UIFont(name: "Charter", size: 16)
        label.textColor = UIColor(red: 0.922, green: 0.922, blue: 0.961, alpha: 0.6)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.aHeight
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
}

extension dashboardViewController{
    enum Constants{
        static let startGameButtonOfSet: CGFloat = 65.0
        static let leadingOfSet: CGFloat = 20.0
        static let startButtonHeight: CGFloat = 65.0
        static let tableViewOfSet: CGFloat = 25.0
        static let headerLabelHeight: CGFloat = 40.0
        static let tableViewOfSetLim: CGFloat = headerLabelHeight + startButtonHeight + startGameButtonOfSet + tableViewOfSet + 20.0
        static let cHeight: CGFloat = 55.0
        static let aHeight: CGFloat = 55.0
    }
}
