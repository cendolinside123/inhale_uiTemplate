//
//  ExerciseViewController.swift
//  bukanDigiSaham
//
//  Created by Mac on 15/03/21.
//

import UIKit

class ExerciseViewController: UIViewController {
    
    
    
    private let scrollView = UIScrollView()
    private let labelTitleExercise = UILabel()
    private let viewForLabel = UIView()
    private let labelExerciseKeterangan = UILabel()
    private let stackViewTopLabel:UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.layoutMargins.left = 10
        stack.layoutMargins.right = 10
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    private let stackViewContent:UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 50
        return stack
    }()
    
    private var collectionViewMenu:UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: flowLayout)

        return collection
    }()
    //private var collectionViewMenu:UICollectionView? = nil
    
    private var controller:ViewExerciseController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.00000)
        
        // Do any additional setup after loading the view.
        addLayout()
        addConstraints()
        controller = ViewExerciseController(view: self)
        controller?.setupCollection()
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func addLayout() {
        addScrollView()
        addViewForLabel()
        addLabelTitleExercise()
        addLabelExerciseKeterangan()
        addCollectionViewMenu()
        addStackView()
    }
    
    private func addConstraints() {
        
        let views = ["scrollView":scrollView,"stackViewContent":stackViewContent,"stackViewTopLabel":stackViewTopLabel]
        
        let metrix:[String:Any] = ["view_width":self.view.frame.size.width]
        
        var constraints = [NSLayoutConstraint]()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        let hScrollView = "H:|-15-[scrollView]-15-|"
        let vScrollView = "V:|-30-[scrollView]-0-|"
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: hScrollView, options: .alignAllTop, metrics: metrix, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: vScrollView, options: .alignAllLeading, metrics: metrix, views: views)
        
        stackViewContent.translatesAutoresizingMaskIntoConstraints = false
        let hStackViewContent = "H:|-0-[stackViewContent(view_width)]-0-|"
        let vStackViewContent = "V:|-10-[stackViewContent]-0-|"
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: hStackViewContent, options: .alignAllTop, metrics: metrix, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: vStackViewContent, options: .alignAllLeading, metrics: metrix, views: views)
        constraints += [NSLayoutConstraint(item: stackViewContent, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)]
        
        
        stackViewTopLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let hStackViewTopLabel = "H:|-0-[stackViewTopLabel]-0-|"
        let vStackViewTopLabel = "V:|-0-[stackViewTopLabel]-0-|"
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: hStackViewTopLabel, options: .alignAllTop, metrics: metrix, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: vStackViewTopLabel, options: .alignAllLeading, metrics: metrix, views: views)
        
        viewForLabel.translatesAutoresizingMaskIntoConstraints = false
        
        constraints += [NSLayoutConstraint(item: viewForLabel, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1.2/9, constant: 0)]
        
        labelTitleExercise.translatesAutoresizingMaskIntoConstraints = false
        labelExerciseKeterangan.translatesAutoresizingMaskIntoConstraints = false
        
        constraints += [NSLayoutConstraint(item: labelTitleExercise, attribute: .height, relatedBy: .equal, toItem: labelExerciseKeterangan, attribute: .height, multiplier: 1, constant: 0)]
        
        collectionViewMenu.translatesAutoresizingMaskIntoConstraints = false

        let collectionViewConstraints = NSLayoutConstraint(item: collectionViewMenu, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 400)
        collectionViewConstraints.identifier = "collectionViewConstraints_height"

        constraints += [collectionViewConstraints]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addScrollView() {
        view.addSubview(scrollView)
    }
    
    private func addViewForLabel() {
        scrollView.addSubview(viewForLabel)
    }
    
    private func addCollectionViewMenu() {
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .vertical
        //flowLayout.itemSize = CGSize(width: self.view.bounds.width / 2, height: self.view.bounds.width / 2)
        
        //collectionViewMenu = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        scrollView.addSubview(collectionViewMenu)
    }
    
    private func addLabelTitleExercise() {
        labelTitleExercise.text = "Exercises"
        labelTitleExercise.font = UIFont.boldSystemFont(ofSize: 36)
        labelTitleExercise.textColor = UIColor(red: CGFloat(20/255), green: CGFloat(20/255), blue: CGFloat(20/255), alpha: 1)
        viewForLabel.addSubview(labelTitleExercise)
    }
    
    private func addLabelExerciseKeterangan() {
        labelExerciseKeterangan.text = "Powerful breathing exercise to help you to relax and archive a clear state of mind"
        labelExerciseKeterangan.numberOfLines = 20
        labelExerciseKeterangan.textColor = UIColor(red: 0.65, green: 0.65, blue: 0.65, alpha: 1)
        labelExerciseKeterangan.font = UIFont.boldSystemFont(ofSize: 16)
        viewForLabel.addSubview(labelExerciseKeterangan)
    }
    
    private func addStackView() {
        stackViewTopLabel.addArrangedSubview(labelTitleExercise)
        stackViewTopLabel.addArrangedSubview(labelExerciseKeterangan)
        
        viewForLabel.addSubview(stackViewTopLabel)
        
        stackViewContent.addArrangedSubview(viewForLabel)
        stackViewContent.addArrangedSubview(collectionViewMenu)
        scrollView.addSubview(stackViewContent)
        
    }
}

extension ExerciseViewController {
    func getCollection() -> UICollectionView {
        return collectionViewMenu
    }
}
