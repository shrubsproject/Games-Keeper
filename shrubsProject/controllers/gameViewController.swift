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
        
        leftButton.setImage(UIImage(named: "..."), for: .normal)
        leftButton.addTarget(self, action: #selector(prePlayer), for: .touchUpInside)
        
        rightButton.setImage(UIImage(named: "..."), for: .normal)
        rightButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        
        collectionView.backgroundColor = UIColor.blue
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = false
        
        timerLabel.font = UIFont(name: "Zapf Dignbats", size: 30)
        timerLabel.textColor = UIColor.white
        
        playButton.setImage(UIImage(named: "..."), for: .normal)
        playButton.addTarget(self, action: #selector(stopAndPlay), for: .touchUpInside)
    }
    
    func configureLayout(){
        let multiplier: CGFloat = (view.safeAreaLayoutGuide.layoutFrame.height / Constants.verticalHeight)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    @objc func addButtonTap(sender: UIButton){
        if sender == oneButton{
            viewModel.add(score: 1)
        }
        if sender == buttons[0]{
            viewModel.add(score: -10)
        }
        if sender == buttons[1]{
            viewModel.add(score: -5)
        }
        if sender == buttons[2]{
            viewModel.add(score: -1)
        }
        if sender == buttons[0]{
            viewModel.add(score: 5)
        }
        if sender == buttons[0]{
            viewModel.add(score: 10)
        }
        collectionView.reloadItems(at: [IndexPath(item: viewModel.currentPlayIndex, section: 0)])
    }
    
    @objc func newGame(){
        viewModel.newGame()
    }
    
    @objc func showResults(){
        viewModel.showResults()
    }
    
    @objc func showDice(){
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        navigationController?.setNavigationBarHidden(true, animated: false)
        diceView.isHidden = false
    }
    
    @objc func hideDice(){
        diceView.isHidden = true
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @objc func back(){
        viewModel.resetTurn()
        collectionView.reloadItems(at: [IndexPath(row: viewModel.currentPlayerIndex, section: 0)])
    }
    
    @objc func prePlayer(){
        if (viewModel.currentPlayerIndex == viewModel.players.count - 1){
            viewModel.currentPlayerIndex = 0
        }else{
            viewModel.currentPlayerIndex += 1
        }
        scrollToCurrentIndex()
    }
    
    @objc func stopAndPlay(){
        if let timer = timer, timer.isValid {
            timerLabel.textColor = UIColor.gray
            playButton.setImage(UIImage(named: "..."), for: .normal)
            stopTimer()
        }else{
            timerLabel.textColor = UIColor.white
            playButton.setImage(UIImage(named: "..."), for: .normal)
            startTimer()
        }
    }
    
    func stopTimer(){
        stopTimer = Date.timeIntervalSinceReferenceDate
        timer?.invalidate()
    }
    
    func startTimer(){
        
    }
}
