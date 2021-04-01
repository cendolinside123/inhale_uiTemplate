//
//  InfoCollectionViewCell.swift
//  UI Templaye
//
//  Created by Mac on 17/03/21.
//  Copyright © 2021 jan. All rights reserved.
//

import UIKit

class InfoCollectionViewCell: UICollectionViewCell {
    
    private let imageInfo = UIImage()
    private let descriptionInfo = UILabel()
    private let stackView:UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .center
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addInit() {
        
    }
    
    private func addLayout() {
        
    }
    
    private func addConstraints() {
        
    }
    
    private func addImage() {
        
    }
    
}
