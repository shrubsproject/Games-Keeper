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
        tableView.separatorColor = UIColor.white
        tableView.separatorStyle = .singleLine
        tableView.allowsSelection = false
        
        view.addSubview(startGameButton)
        view.addSubview(tableView)
        view.addSubview(headerLabel)
        
        tableView.backgroundColor = UIColor(named: "Color-3")
        view.backgroundColor = UIColor(named: "Color-3")
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.isTranslucent = false
        
        startGameButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        startGameButton.setTitle("start game", for: .normal)
        startGameButton.addTarget(self, action: #selector(start), for: .touchUpInside)
        startGameButton.isEnabled = false
        startGameButton.isShadow = true
        
        headerLabel.font = UIFont.systemFont(ofSize: 40)
        headerLabel.text = "game counter"
        headerLabel.textColor = UIColor.white
        if let rootViewController = UIApplication.shared.delegate?.window??.rootViewController, rootViewController !== navigationController
        { navigationItem.leftBarButtonItem = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(dismissView))
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
        cell.backgroundColor = UIColor.white
        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        Constants.cHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: Constants.cHeight))
        view.backgroundColor = UIColor.systemPink
        
        let label = UILabel(frame: .zero)
        label.text = "Players"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.cHeight
    }
}

extension dashboardViewController{
    enum Constants{
        static let startGameButtonOfSet: CGFloat = 50.0
        static let leadingOfSet: CGFloat = 20.0
        static let startButtonHeight: CGFloat = 55.0
        static let tableViewOfSet: CGFloat = 20.0
        static let headerLabelHeight: CGFloat = 40.0
        static let tableViewOfSetLim: CGFloat = headerLabelHeight + startGameButtonOfSet + tableViewOfSet + 10.0
        static let cHeight: CGFloat = 50.0
    }
}
