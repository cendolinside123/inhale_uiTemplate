//
//  ViewExerciseController.swift
//  UI Templaye
//
//  Created by Mac on 24/03/21.
//  Copyright © 2021 jan. All rights reserved.
//

import Foundation
import UIKit

class ViewExerciseController: NSObject {
    
    private var view: ExerciseViewController? = nil
    private let dataExercise:[Exercise] = [Exercise(image: #imageLiteral(resourceName: "breathFocusTechnique"), textInfo: "Breath focus technique"),Exercise(image: #imageLiteral(resourceName: "diaphragmaticBreath"), textInfo: "Diaphragmatic breathing"),Exercise(image: #imageLiteral(resourceName: "deepBreathing"), textInfo: "Sitali breathing"),Exercise(image: #imageLiteral(resourceName: "deepBreathing"), textInfo: "Deep breathing")]
    
    override init() {
        //super.init()
    }
    
    convenience init(view:ExerciseViewController) {
        self.init()
        self.view = view
    }
    
    func setupCollection() {
        self.view?.getCollection().delegate = self
        self.view?.getCollection().dataSource = self
        self.view?.getCollection().register(MenuExerciseTableViewCell.self, forCellWithReuseIdentifier: "exerciseCell")
        self.view?.getCollection().backgroundColor = .clear
        
    }
    
    
}
extension ViewExerciseController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataExercise.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "exerciseCell", for: indexPath) as? MenuExerciseTableViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setValue(image: dataExercise[indexPath.item].image, text: dataExercise[indexPath.item].textInfo)
        
        return cell
    }
    
    
}
extension ViewExerciseController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        print("frame width: \(self.view?.view.frame.width)")
        
        return CGSize(width: ((self.view!.view.frame.width - 70) / 2), height: (250 / 2))
    }
    
    
    
}
