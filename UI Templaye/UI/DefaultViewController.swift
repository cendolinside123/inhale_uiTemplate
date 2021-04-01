//
//  DefaultViewController.swift
//  bukanDigiSaham
//
//  Created by Mac on 15/03/21.
//

import UIKit

class DefaultViewController: UIViewController {
    
    private let viewForLabel = UIView()
    private let labelRegion = UILabel()
    private let labelTemprature = UILabel()
    private let stackViewTopLabel:UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        return stack
    }()
    private let scrollView = UIScrollView()
    private let stackViewContent: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 5
        return stack
    }()
    private let viewForCircle = UIView()
    private let circle = UIView()
    private let viewInsideCircle = UIView()
    private let labelNumberInsideCircle = UILabel()
    private let labelTextInsideCircle = UILabel()
    private let stackViewInsideCircle:UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        
        return stack
    }()
    private var infoTableView = UITableView()
    
    private var controller: ViewDefaultController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.00000)

        // Do any additional setup after loading the view.
        
        addLayout()
        addConstraints()
        setupCircle()
        controller = ViewDefaultController(view: self)
        controller?.setupTable()
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
        addLabelRegion()
        addLabelTemprature()
        addCircle()
        //addInfoCollectionView()
        addStackViewContent()
        
    }
    
    private func addScrollView() {
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)
    }
    
    private func addViewForLabel() {
        scrollView.addSubview(viewForLabel)
    }
    
    private func addLabelRegion() {
        labelRegion.text = "Seattle, WA"
        labelRegion.textColor = UIColor(red: CGFloat(20/255), green: CGFloat(20/255), blue: CGFloat(20/255), alpha: 1)
        labelRegion.font = UIFont.boldSystemFont(ofSize: 36)
//        labelRegion.textColor = .black
        viewForLabel.addSubview(labelRegion)
    }
    
    private func addLabelTemprature() {
        labelTemprature.text = "37° cloudy"
        labelTemprature.textColor = .lightGray
        labelTemprature.font = UIFont.boldSystemFont(ofSize: 36)
        //labelTemprature.textColor = .black
        viewForLabel.addSubview(labelTemprature)
    }
    
    private func addCircle() {
        labelNumberInsideCircle.text = "15"
        labelNumberInsideCircle.textColor = UIColor(red: CGFloat(10/255), green: CGFloat(255/255), blue: CGFloat(255/255), alpha: 1)
        //labelNumberInsideCircle.textColor = .black
        labelNumberInsideCircle.font = UIFont.boldSystemFont(ofSize: 80)
        viewInsideCircle.addSubview(labelNumberInsideCircle)
        
        labelTextInsideCircle.text = "AQI"
        labelTextInsideCircle.textColor = UIColor(red: CGFloat(222/255), green: CGFloat(222/255), blue: CGFloat(222/255), alpha: 0.5)
//        labelTextInsideCircle.textColor = .black
        labelTextInsideCircle.font = UIFont.boldSystemFont(ofSize: 16)
        viewInsideCircle.addSubview(labelTextInsideCircle)
        
        
        stackViewInsideCircle.addArrangedSubview(labelNumberInsideCircle)
        stackViewInsideCircle.addArrangedSubview(labelTextInsideCircle)
        
        viewInsideCircle.addSubview(stackViewInsideCircle)
//        circle.mainColor = .white
//        circle.ringTickness = 30
        circle.addSubview(viewInsideCircle)
        //circle.bringSubviewToFront(viewInsideCircle)
        
        viewForCircle.addSubview(circle)
        viewForCircle.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.00000)
        //circle.createShadow()
        scrollView.addSubview(viewForCircle)
        
    }
    
    private func setupCircle() {
        circle.backgroundColor = .white
        circle.layer.cornerRadius = circle.bounds.width/2
        circle.clipsToBounds = true
        circle.layer.masksToBounds = false
        circle.layer.shadowColor = UIColor(red: CGFloat(10/255), green: CGFloat(255/255), blue: CGFloat(255/255), alpha: 1).cgColor
        //circle.layer.shadowColor = UIColor.black.cgColor
        circle.layer.shadowOpacity = 0.3
        circle.layer.shadowOffset = CGSize(width: 0, height: 1)
        circle.layer.shadowRadius = 30
    }
    
    private func addStackViewContent() {
        
        stackViewTopLabel.addArrangedSubview(labelRegion)
        stackViewTopLabel.addArrangedSubview(labelTemprature)
        
//        stackViewTopLabel = UIStackView(arrangedSubviews: [labelRegion,labelTemprature])
//        stackViewTopLabel?.axis = .vertical
//        stackViewTopLabel?.distribution = .fill
//        stackViewTopLabel?.alignment = .fill
        //stackViewTopLabel?.spacing = -40
        viewForLabel.addSubview(stackViewTopLabel)
        
        stackViewContent.addArrangedSubview(viewForLabel)
        stackViewContent.addArrangedSubview(viewForCircle)
        stackViewContent.addArrangedSubview(infoTableView)
        
//        stackViewContent = UIStackView(arrangedSubviews: [viewForLabel,viewForCircle,infoCollectionView!])
//        stackViewContent?.axis = .vertical
//        stackViewContent?.alignment = .fill
//        stackViewContent?.distribution = .fill
//        stackViewContent?.spacing = 5
        
        scrollView.addSubview(stackViewContent)
    }
    
    private func addInfoCollectionView() {
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//
//        infoCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        infoCollectionView?.backgroundColor = .blue
//        scrollView.addSubview(infoCollectionView!)
        infoTableView.backgroundColor = .clear
        infoTableView.separatorStyle = .none
        infoTableView.showsVerticalScrollIndicator = false
        scrollView.addSubview(infoTableView)
    }
    
    private func addConstraints() {
        
        
        
        let views = ["scrollView":scrollView,"stackViewContent":stackViewContent,"stackViewTopLabel":stackViewTopLabel,"stackViewInsideCircle":stackViewInsideCircle,"viewInsideCircle":viewInsideCircle]
        let metrix:[String:Any] = ["view_width":self.view.frame.size.width,"cicle_width":self.circle.frame.width]
        
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
        //constraints += [NSLayoutConstraint(item: stackViewContent, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)]
        
        stackViewTopLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let hStackViewTopLabel = "H:|-0-[stackViewTopLabel]-0-|"
        let vStackViewTopLabel = "V:|-0-[stackViewTopLabel]-0-|"
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: hStackViewTopLabel, options: .alignAllTop, metrics: metrix, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: vStackViewTopLabel, options: .alignAllLeading, metrics: metrix, views: views)
        
        viewForLabel.translatesAutoresizingMaskIntoConstraints = false
        
        constraints += [NSLayoutConstraint(item: viewForLabel, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1.2/9, constant: 0)]
        
        
        labelRegion.translatesAutoresizingMaskIntoConstraints = false
        labelTemprature.translatesAutoresizingMaskIntoConstraints = false
        
        //constraints += [NSLayoutConstraint(item: labelRegion, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 15)]
        constraints += [NSLayoutConstraint(item: labelRegion, attribute: .width, relatedBy: .equal, toItem: labelTemprature, attribute: .width, multiplier: 1, constant: 0)]
        constraints += [NSLayoutConstraint(item: labelRegion, attribute: .height, relatedBy: .equal, toItem: labelTemprature, attribute: .height, multiplier: 3/2.5, constant: 0)]
        
        circle.translatesAutoresizingMaskIntoConstraints = false
        viewForCircle.translatesAutoresizingMaskIntoConstraints = false
        labelNumberInsideCircle.translatesAutoresizingMaskIntoConstraints = false
        labelTextInsideCircle.translatesAutoresizingMaskIntoConstraints = false
        stackViewInsideCircle.translatesAutoresizingMaskIntoConstraints = false
        viewInsideCircle.translatesAutoresizingMaskIntoConstraints = false
        
        constraints += [NSLayoutConstraint(item: labelNumberInsideCircle, attribute: .height, relatedBy: .equal, toItem: labelTextInsideCircle, attribute: .height, multiplier: 5/2, constant: 0)]
        
        let hStackViewInsideCircle = "H:|-[stackViewInsideCircle]-|"
        let vStackViewInsideCircle = "V:|-[stackViewInsideCircle]-|"

        constraints += NSLayoutConstraint.constraints(withVisualFormat: hStackViewInsideCircle, options: .alignAllTop, metrics: metrix, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: vStackViewInsideCircle, options: .alignAllLeading, metrics: metrix, views: views)
        
        constraints += [NSLayoutConstraint(item: viewInsideCircle, attribute: .height, relatedBy: .equal, toItem: viewInsideCircle, attribute: .width, multiplier: 1, constant: 0)]
        constraints += [NSLayoutConstraint(item: viewInsideCircle, attribute: .width, relatedBy: .equal, toItem: circle, attribute: .width, multiplier: 2/5, constant: 0)]
        
        constraints += [NSLayoutConstraint(item: viewInsideCircle, attribute: .centerX, relatedBy: .equal, toItem: circle, attribute: .centerX, multiplier: 1, constant: 0)]
        constraints += [NSLayoutConstraint(item: viewInsideCircle, attribute: .centerY, relatedBy: .equal, toItem: circle, attribute: .centerY, multiplier: 1, constant: 0)]
//
//        constraints += [NSLayoutConstraint(item: stackViewInsideCircle, attribute: .centerX, relatedBy: .equal, toItem: circle, attribute: .centerX, multiplier: 1, constant: 0)]
//        constraints += [NSLayoutConstraint(item: stackViewInsideCircle, attribute: .centerY, relatedBy: .equal, toItem: circle, attribute: .centerY, multiplier: 1, constant: 0)]
        
        constraints += [NSLayoutConstraint(item: circle, attribute: .height, relatedBy: .equal, toItem: circle, attribute: .width, multiplier: 1, constant: 0)]
        constraints += [NSLayoutConstraint(item: circle, attribute: .width, relatedBy: .equal, toItem: viewForCircle, attribute: .width, multiplier: 4/5, constant: 0)]
        
        
        constraints += [NSLayoutConstraint(item: circle, attribute: .centerX, relatedBy: .equal, toItem: viewForCircle, attribute: .centerX, multiplier: 1, constant: 0)]
        constraints += [NSLayoutConstraint(item: circle, attribute: .centerY, relatedBy: .equal, toItem: viewForCircle, attribute: .centerY, multiplier: 1, constant: 0)]
        constraints += [NSLayoutConstraint(item: viewForCircle, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 5/9, constant: 0)]
        
        infoTableView.translatesAutoresizingMaskIntoConstraints = false
        let tableInfoConstrains = NSLayoutConstraint(item: infoTableView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        tableInfoConstrains.identifier = "infoTableView_height"
        constraints += [tableInfoConstrains]
        
        
        
        NSLayoutConstraint.activate(constraints)
        circle.layoutIfNeeded()
    }
    

}
extension DefaultViewController {
    func getTabel() -> UITableView {
        return infoTableView
    }
}
