//
//  ViewDefaultController.swift
//  UI Templaye
//
//  Created by Mac on 22/03/21.
//  Copyright © 2021 jan. All rights reserved.
//

import Foundation
import UIKit

class ViewDefaultController: NSObject {
    
    
    private var view: DefaultViewController? =  nil
    private let dataInfo:[Info] = [Info(image: #imageLiteral(resourceName: "goodAir"), textInfo: "Air quality is good", background: UIColor(red: CGFloat(10/255), green: CGFloat(255/255), blue: CGFloat(255/255), alpha: 1)),Info(image: #imageLiteral(resourceName: "lungs"), textInfo: "Belly breathing can help you use your diaphragm. Do belly breathing more oftent", background: .blue)]
    
    override init() {
        
    }
    
    convenience init(view:DefaultViewController) {
        self.init()
        self.view = view
    }
    
    func setupTable() {
        self.view?.getTabel().delegate = self
        self.view?.getTabel().dataSource = self
        self.view?.getTabel().register(InfoTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view?.getTabel().backgroundColor = .clear
        self.view?.getTabel().separatorStyle = .none
    }
    
}

extension ViewDefaultController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? InfoTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setValue(image: dataInfo[indexPath.row].image, text: dataInfo[indexPath.row].textInfo, backgroundColor: dataInfo[indexPath.row].background)
        
        cell.separatorInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        cell.layer.borderWidth = 5
        cell.layer.borderColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.00000).cgColor
        
        
        //cell.separatorInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    
    
}


