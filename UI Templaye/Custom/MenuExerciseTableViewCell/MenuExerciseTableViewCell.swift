//
//  MenuExerciseTableViewCell.swift
//  UI Templaye
//
//  Created by Mac on 24/03/21.
//  Copyright © 2021 jan. All rights reserved.
//

import Foundation
import UIKit

class MenuExerciseTableViewCell: UICollectionViewCell {
    let labelName = UILabel()
    let imageIcon = UIImageView()
    let viewImageContainer = UIView()
    let stackViewContent:UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 12
//        stack.layoutMargins.left = 12
//        stack.layoutMargins.right = 0
//        stack.layoutMargins.top = 0
//        stack.layoutMargins.bottom = 0
        return stack
    }()
    let stackImage:UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .fill
//        stack.spacing = 12
//        stack.layoutMargins.left = 12
//        stack.layoutMargins.right = 12
//        stack.layoutMargins.top = 0
//        stack.layoutMargins.bottom = 0
        return stack
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setCorner_Margin()
        addLayout()
        addConstraints()
        
    }
    
    
    private func addLayout() {
        addLabel()
        addImageIcon()
        addStackViewContainer()
    }
    
    private func addConstraints() {
        let views = ["stackViewContent":stackViewContent,"imageIcon":imageIcon]
        let metrix:[String:Any] = ["containerWidth":self.contentView.frame.width]
        var constraints = [NSLayoutConstraint]()
        
        stackViewContent.translatesAutoresizingMaskIntoConstraints = false
        
        let hStackViewContent = "H:|-12-[stackViewContent]-12-|"
        let vStackViewContent = "V:|-5-[stackViewContent]-5-|"
        constraints += NSLayoutConstraint.constraints(withVisualFormat: hStackViewContent, options: .alignAllTop, metrics: metrix, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: vStackViewContent, options: .alignAllLeading, metrics: metrix, views: views)
        
        labelName.translatesAutoresizingMaskIntoConstraints = false
        //stackImage.translatesAutoresizingMaskIntoConstraints = false
        
        //constraints += [NSLayoutConstraint(item: labelName, attribute: .height, relatedBy: .equal, toItem: stackImage, attribute: .height, multiplier: 1, constant: 0)]
        
        viewImageContainer.translatesAutoresizingMaskIntoConstraints = false
        constraints += [NSLayoutConstraint(item: labelName, attribute: .height, relatedBy: .equal, toItem: viewImageContainer, attribute: .height, multiplier: 1, constant: 0)]
        
        imageIcon.translatesAutoresizingMaskIntoConstraints = false
        
        let hImageIcon = "H:[imageIcon]-5-|"
        let vImageIcon = "V:[imageIcon]-|"
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: hImageIcon, options: .alignAllTop, metrics: metrix, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: vImageIcon, options: .alignAllLeading, metrics: metrix, views: views)
        
        constraints += [NSLayoutConstraint(item: imageIcon, attribute: .height, relatedBy: .equal, toItem: viewImageContainer, attribute: .height, multiplier: 4/5, constant: 0)]
        constraints += [NSLayoutConstraint(item: imageIcon, attribute: .height, relatedBy: .equal, toItem: imageIcon, attribute: .width, multiplier: 1, constant: 0)]
        
        
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    private func addLabel() {
        labelName.numberOfLines = 9
        labelName.textColor = .black
        contentView.addSubview(labelName)
    }
    
    private func addImageIcon() {
        viewImageContainer.addSubview(imageIcon)
        contentView.addSubview(viewImageContainer)
    }
    
    private func addStackViewContainer() {
        //stackImage.addArrangedSubview(imageIcon)
        stackViewContent.addArrangedSubview(labelName)
        stackViewContent.addArrangedSubview(viewImageContainer)
        contentView.addSubview(stackViewContent)
    }
    
    private func setCorner_Margin() {
        self.layer.cornerRadius = 10
        self.layer.backgroundColor = UIColor.white.cgColor
    }
    
    
}
extension MenuExerciseTableViewCell {
    func setValue(image:UIImage,text:String) {
        let tintedImage = image.withRenderingMode(.alwaysTemplate)
        imageIcon.image = tintedImage
        imageIcon.tintColor = UIColor(red: CGFloat(10/255), green: CGFloat(255/255), blue: CGFloat(255/255), alpha: 1)
        labelName.text = text
    }
}
