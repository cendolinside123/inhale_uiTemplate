//
//  CircleView.swift
//  bukanDigiSaham
//
//  Created by Mac on 16/03/21.
//

import UIKit

class CircleView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    //private let containerView = UIView()
    
    var mainColor:UIColor = UIColor(white: 1, alpha: 1) {
        didSet{
            print("set main color to: \(mainColor)")
        }
    }
    
    var ringColor:UIColor = UIColor(red: CGFloat(10/255), green: CGFloat(255/255), blue: CGFloat(255/255), alpha: 1) {
        didSet {
            print("set ring color to: \(ringColor)")
        }
    }
    
    var ringTickness:CGFloat = 10 {
        didSet {
            print("set ring tickness to: \(ringTickness)")
        }
    }
    
    var isSelected:Bool = true
    
    override func draw(_ rect: CGRect) {
//        setupLayout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = .white
        //setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        //backgroundColor = .white
        setupLayout()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //setupLayout()
    }
    
    func setupLayout() {
        self.backgroundColor = mainColor
        layer.cornerRadius = bounds.size.width / 2
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.layer.shadowColor = ringColor.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = ringTickness
    }
    
    

}
