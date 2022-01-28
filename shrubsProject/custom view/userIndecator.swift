//
//  userIndecator.swift
//  shrubsProject
//
//  Created by Ilya Egorov on 28.01.2022.
//

import UIKit

class UserIndicator: UIScrollView {
    
    let stackView = UIStackView()
    var labels: [UILabel]!
    
    var activeIndex: Int {
        set{
            if newValue >= 0 && newValue < _charcters.count {
                index = newValue
            }
        }
        get{
            index
        }
    }
    
    private var index: Int = 0{
        willSet{
            labels[index].textColor = UIColor.gray
            labels[newValue].textColor = UIColor.white
            focus(at: newValue)
        }
    }
    
    var charcters: [String]{
        set{
            _charcters = newValue.compactMap({ !$0.isEmpty ? String($0.first!) : nil})
        }
        get{ _charcters }
    }
    
    private var _charcters: [String] = .init() {
        willSet{
            stackView.subviews.forEach({ $0.removeFromSuperview() })
            labels = .init()
            for charcter in newValue {
                let label = UILabel(frame: .zero)
                label.font = UIFont(name: "...", size: 30.0)
                label.textColor = UIColor.gray
                label.text = charcter
                stackView.addArrangedSubview(label)
                labels.append(label)
            }
        }
    }
    
    func commonInit(){
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor)
        ])
        showsHorizontalScrollIndicator = false
        isScrollEnabled = false
    }
    
    func focus(at position: Int){
        let scrollViewCenter = bounds.width / 2
        setContentOffset(CGPoint(x: position * 25 - Int(scrollViewCenter), y: 0), animated: true)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
}
