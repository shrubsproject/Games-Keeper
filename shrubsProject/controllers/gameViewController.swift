//
//  gameViewController.swift
//  shrubsProject
//
//  Created by Ilya Egorov on 02.01.2022.
//

import UIKit

final class gameViewController: UIViewController{
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let headerLabel = UILabel()
    let diceButton  = UIButton()
    let timerLabel = UILabel()
    let playButton = UIButton()
    let stackView = UIStackView()
    let backButton = UIButton()
    let leftButton = UIButton()
    let rightButton = UIButton()
    let diceView = DiceView(frame: .zero)
    let userIndicator = UserIndicator(frame: .zero)
    
    let buttons: [ShadowButton] = [.init(), .init(), .init(), .init(), .init()]
    let oneButton: ShadowButton = ShadowButton()
    
    var viewModel: gameViewModel!
    
    var timer: Timer?
    var startTimer: TimeInterval?
    var stopTimer: TimeInterval?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configureUI(){
        view.addSubview(headerLabel)
        view.addSubview(collectionView)
        view.addSubview(diceButton)
        view.addSubview(timerLabel)
        view.addSubview(playButton)
        view.addSubview(oneButton)
        view.addSubview(backButton)
        view.addSubview(leftButton)
        view.addSubview(rightButton)
        view.addSubview(stackView)
        
        view.addSubview(userIndicator)
        view.addSubview(diceView)
        
        view.backgroundColor = UIColor.white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "New Game", style: .plain, target: self, action: #selector(newGame))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Results", style: .plain, target: self, action: #selector(showResults))
        
        headerLabel.text = "Game"
        headerLabel.font = UIFont(name: "Zapf Dignbats", size: 30)
        headerLabel.textColor = UIColor.black
        
        buttons.forEach{
            stackView.addArrangedSubview($0)
            $0.titleLabel?.font = UIFont(name: "Zapf Dignbats", size: 25)
            $0.addTarget(self, action: #selector(addButtonTap(sender:)), for: .touchUpInside)
        }
        
        buttons[0].setTitle("-10", for: .normal)
        buttons[1].setTitle("-5", for: .normal)
        buttons[2].setTitle("-1", for: .normal)
        buttons[3].setTitle("+5", for: .normal)
        buttons[4].setTitle("+10", for: .normal)
        
        oneButton.titleLabel?.font = UIFont(name: "Zapf Dignbats", size: 30)
        oneButton.setTitle("+1", for: .normal)
        oneButton.addTarget(self, action: #selector(addButtonTap(sender:)), for: .touchUpInside)
        
        diceButton.setImage(UIImage(named: "Four"), for: .normal)
        diceButton.addTarget(self, action: #selector(showDice), for: .touchUpInside)
        
        diceView.isHidden = true
        diceView.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(hideDice)))
        
        
    }
}
