//
//  InfoTableViewCell.swift
//  UI Templaye
//
//  Created by Mac on 22/03/21.
//  Copyright © 2021 jan. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    
    private let imageBackground = UIView()
    private let imageInfo = UIImageView()
    private let labelInfo = UILabel()
    private let stackViewInfo:UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 12
        stack.layoutMargins.left = 12
        stack.layoutMargins.right = 12
        stack.layoutMargins.top = 0
        stack.layoutMargins.bottom = 0
        return stack
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAll()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupAll() {
        self.contentView.backgroundColor = .white
        setCornerRadius()
        setupLayout()
        setConstraints()
    }
    
    private func setupLayout() {
        addImageInfo()
        addLabelInfo()
        addStackViewInfo()
        
    }
    
    private func setConstraints() {
        var constraints = [NSLayoutConstraint]()
        let views = ["stackViewInfo":stackViewInfo,"imageBackground":imageBackground,"imageInfo":imageInfo]
        let metrix:[String:Any] = [:]
        
        stackViewInfo.translatesAutoresizingMaskIntoConstraints = false
        
        let hStackViewInfo = "H:|-15-[stackViewInfo]-15-|"
        let vStackViewInfo = "V:|-5-[stackViewInfo]-5-|"
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: hStackViewInfo, options: .alignAllTop, metrics: metrix, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: vStackViewInfo, options: .alignAllLeading, metrics: metrix, views: views)
        
        imageInfo.translatesAutoresizingMaskIntoConstraints = false
        //labelInfo.translatesAutoresizingMaskIntoConstraints = false
        
        constraints += [NSLayoutConstraint(item: imageBackground, attribute: .width, relatedBy: .equal, toItem: contentView, attribute: .height, multiplier: 3.3/5, constant: 0)]
        constraints += [NSLayoutConstraint(item: imageBackground, attribute: .width, relatedBy: .equal, toItem: imageBackground, attribute: .height, multiplier: 1, constant: 0)]
        
        let hImageInfo = "H:|-10-[imageInfo]-10-|"
        let vImageInfo = "V:|-10-[imageInfo]-10-|"
        constraints += NSLayoutConstraint.constraints(withVisualFormat: hImageInfo, options: .alignAllCenterY, metrics: metrix, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: vImageInfo, options: .alignAllCenterX, metrics: metrix, views: views)
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    private func addImageInfo() {
//        imageInfo.layer.cornerRadius = 10
//        imageInfo.clipsToBounds = true
        imageBackground.addSubview(imageInfo)
        
        imageBackground.layer.cornerRadius = 10
        imageBackground.clipsToBounds = true
        
        contentView.addSubview(imageBackground)
    }
    
    private func addLabelInfo() {
        labelInfo.textColor = .black
        labelInfo.numberOfLines = 99
        labelInfo.font = labelInfo.font.withSize(11)
        contentView.addSubview(labelInfo)
    }
    
    private func addStackViewInfo() {
        stackViewInfo.addArrangedSubview(imageBackground)
        stackViewInfo.addArrangedSubview(labelInfo)
        contentView.addSubview(stackViewInfo)
    }
    
    private func setCornerRadius() {
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }

}

extension InfoTableViewCell {
    func setValue(image:UIImage,text:String,backgroundColor:UIColor? = UIColor(red: CGFloat(10/255), green: CGFloat(255/255), blue: CGFloat(255/255), alpha: 1)) {
        let tintedImage = image.withRenderingMode(.alwaysTemplate)
        imageInfo.image = tintedImage
        imageInfo.tintColor = .white
        imageInfo.backgroundColor = backgroundColor
        imageBackground.backgroundColor = backgroundColor
        labelInfo.text = text
    }
}
