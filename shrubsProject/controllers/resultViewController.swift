//
//  resultViewController.swift
//  shrubsProject
//
//  Created by Ilya Egorov on 02.01.2022.
//

import UIKit

final class ResultViewController: UIViewController{
    
    var viewModel: ResultViewModel!
    
    let scrollView = UIScrollView()
    let tableView = UITableView(frame: .zero, style: .plain)
    let headerLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        headerLabel.font = UIFont(name: "...", size: 30.0)
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
            headerLabel.heightAnchor.constraint(equalTo: Constants.headerLabelHeight),
            
            scrollView.topAnchor.constraint(equalTo:
                                        )
        ])
    }
}
