//
//  resultViewController.swift
//  shrubsProject
//
//  Created by Ilya Egorov on 02.01.2022.
//

import UIKit

final class ResultViewController: UIViewController{
    
    var viewModel: ResultsViewModel!
    
    let scrollView = UIScrollView()
    let tableView = UITableView(frame: .zero, style: .plain)
    let headerLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confugureUI()
        configureLayout()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ResultCell.self, forCellReuseIdentifier: "TurnID")
        
        let stackView = UIStackView(arrangedSubviews: viewModel.scoreRank().map{ (Player, place) in
            let view = PlayerScoreView(frame: .zero)
            view.setupFromPlayer(player: Player, place: place)
            return view
        })
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        
        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        ])
        
        stackView.arrangedSubviews.forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.heightAnchor.constraint(equalToConstant: 55).isActive = true
            $0.widthAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.width - Constants.horizontalOfSet * 2).isActive = true
        }
    }
    
    func confugureUI(){
        view.addSubview(scrollView)
        view.addSubview(tableView)
        view.addSubview(headerLabel)
        
        view.backgroundColor = UIColor.gray
        navigationItem.backBarButtonItem = nil
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "New Game", style: .plain, target: self, action: #selector(newGame))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Resume", style: .plain, target: self, action: #selector(resume))
        
        headerLabel.text = "Results"
        headerLabel.font = UIFont(name: "Charter", size: 30)
        headerLabel.textColor = UIColor.white
        
        tableView.layer.cornerRadius = 15.0
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = UIColor.white
        tableView.backgroundColor = UIColor.lightGray
    }
    
    func configureLayout(){
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let viewHieght = view.safeAreaLayoutGuide.layoutFrame.height
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: headerLabel.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.horizontalOfSet),
            headerLabel.heightAnchor.constraint(equalToConstant: Constants.headerLabelHeight),
            
            scrollView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: viewHieght * Constants.spacingRatio),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.horizontalOfSet),
            scrollView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: viewHieght * Constants.scrollViewRatio),
            
            tableView.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: viewHieght * Constants.spacingRatio),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor , constant: Constants.horizontalOfSet),
            tableView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.spacingRatio * viewHieght)
        ])
    }
    
    @objc func newGame(){
        viewModel.newGame()
    }
    
    @objc func resume(){
        viewModel.resume()
    }
}

extension ResultViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TurnID", for: indexPath)
        cell.backgroundColor = UIColor(named: "Color-3")
        
        cell.textLabel?.text = viewModel.turns[indexPath.row].player
        cell.textLabel?.font = UIFont(name: "Charter", size: 30)
        cell.textLabel?.textColor = .white
        
        let rightLabel = cell.detailTextLabel!
        rightLabel.font = UIFont.systemFont(ofSize: 30)
        rightLabel.textColor = .white
        
        let score = viewModel.turns[indexPath.row].scoreChange
        let string = score > 0 ? "+\(score)" : "\(score)"
        rightLabel.text = string
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.turns.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        Constants.cellHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: Constants.cellHeight))
        view.backgroundColor = UIColor.gray
        
        let label = UILabel(frame: .zero)
        label.text = "Turns"
        label.font = UIFont(name: "Charter", size: 30)
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.cellHeight
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
}

extension ResultViewController{
    enum Constants{
        static let headerLabelHeight: CGFloat = 42
        static let horizontalOfSet: CGFloat = 20
        static let spacingRatio: CGFloat = 0.03
        static let scrollViewRatio: CGFloat = 0.2
        static let cellHeight: CGFloat = 50.0
    }
}
