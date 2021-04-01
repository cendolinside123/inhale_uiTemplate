//
//  HomeTabViewController.swift
//  bukanDigiSaham
//
//  Created by Mac on 12/03/21.
//

import UIKit

class HomeTabViewController: UIViewController {

    private let containerView = UIView()
    private let tabViewBag = UIView()
    private let tabView = UIView()
    private let buttonHome = UIButton()
    private let buttonMap = UIButton()
    private let buttonExercise = UIButton()
    private let stackViewTabBar:UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        
        return stack
    }()
    private var pageController: UIPageViewController? = nil
    private var collection_ofVC = [UIViewController]()
    private var currentIndex: Int = 1
    
    lazy var defaultVC:DefaultViewController = {
        let home = DefaultViewController()
        return home
    }()
    
    lazy var mapVC:MapViewController = {
        let map = MapViewController()
        
        return map
    }()
    
    lazy var exerciseVC:ExerciseViewController = {
        let exercise = ExerciseViewController()
        
        return exercise
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addLayout()
        addConstraints()
        configurePageController()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
     
    }
    */
    
    private func addContainerView() {
        self.view.addSubview(containerView)
    }
    
    private func addTabViewBag() {
        tabViewBag.backgroundColor = .white
        self.view.addSubview(tabViewBag)
    }
    
    private func addTabBar() {
        tabView.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        
        self.view.addSubview(tabView)
    }
    
    private func addLayout() {
        addContainerView()
        //addTabViewBag()
        addTabBar()
        addButtonHome()
        addExerciseButton()
        addMapButton()
        addStackViewTabBar()
    }
    
    private func addButtonHome() {
        //buttonHome.setTitle("Home", for: .normal)
        buttonHome.setTitleColor(.black, for: .normal)
        let image = #imageLiteral(resourceName: "home")
        let tintedImage = image.withRenderingMode(.alwaysTemplate)
        buttonHome.setImage(tintedImage, for: .normal)
        buttonHome.tintColor = UIColor(red: CGFloat(10/255), green: CGFloat(255/255), blue: CGFloat(255/255), alpha: 1)
        
        buttonHome.contentVerticalAlignment = .fill
        buttonHome.contentHorizontalAlignment = .fill
        buttonHome.imageEdgeInsets = UIEdgeInsets(top: 25, left: 40, bottom: 25, right: 40)
        //buttonHome.contentEdgeInsets = UIEdgeInsets(top: -30, left: -30, bottom: -30, right: -30)
        //buttonHome.imageView?.contentMode = .scaleToFill
        buttonHome.addTarget(self, action: #selector(moveToHome), for: .touchDown)
        tabView.addSubview(buttonHome)
    }
    
    
    private func addMapButton() {
        //buttonMap.setTitle("Map", for: .normal)
        buttonMap.setTitleColor(.black, for: .normal)
        let image = #imageLiteral(resourceName: "location")
        let tintedImage = image.withRenderingMode(.alwaysTemplate)
        buttonMap.setImage(tintedImage, for: .normal)
        buttonMap.tintColor = .gray
        buttonMap.addTarget(self, action: #selector(moveToMap), for: .touchDown)
        tabView.addSubview(buttonMap)
    }
    
    private func addExerciseButton() {
        //buttonExercise.setTitle("Excersise", for: .normal)
        buttonExercise.setTitleColor(.black, for: .normal)
        let image = #imageLiteral(resourceName: "lungs")
        let tintedImage = image.withRenderingMode(.alwaysTemplate)
        buttonExercise.setImage(tintedImage, for: .normal)
        buttonExercise.tintColor = .gray
        buttonExercise.addTarget(self, action: #selector(moveToExercise), for: .touchDown)
        tabView.addSubview(buttonExercise)
    }
    
    private func addStackViewTabBar() {
        stackViewTabBar.addArrangedSubview(buttonMap)
        stackViewTabBar.addArrangedSubview(buttonHome)
        stackViewTabBar.addArrangedSubview(buttonExercise)
        
        tabView.addSubview(stackViewTabBar)
    }
    
    private func configurePageController() {
        
        collection_ofVC = [mapVC,defaultVC,exerciseVC]
        
        pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageController?.delegate = self
        pageController?.delegate = self
        pageController?.view.frame = self.containerView.bounds
        
        addChild(pageController!)
        self.containerView.addSubview((pageController?.view)!)
        pageController?.setViewControllers([collection_ofVC[1]], direction: .forward, animated: false, completion: nil)
        pageController?.didMove(toParent: self)
        
    }
    
    private func addConstraints() {
        var constraints = [NSLayoutConstraint]()
        let views = ["containerView":containerView,"tabViewBag":tabViewBag,"tabView":tabView,"stackViewTabBar":stackViewTabBar]
        
        let metrix = ["viewWidth":self.view.frame.width,"tabView_height":tabView.frame.height]
        
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        tabView.translatesAutoresizingMaskIntoConstraints = false
        
        let hContainerView = "H:|-0-[containerView(viewWidth)]-0-|"
        let hTabView = "H:|-0-[tabView(viewWidth)]-0-|"
        let vContainerView = "V:|-0-[containerView]-0-|"
        let vTabView = "V:[tabView]-0-|"
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: hContainerView, options: .alignAllTop, metrics: metrix, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: hTabView, options: .alignAllTop, metrics: metrix, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: vContainerView, options: .alignAllLeading, metrics: metrix, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: vTabView, options: .alignAllLeading, metrics: metrix, views: views)
        
        constraints += [NSLayoutConstraint(item: containerView, attribute: .height, relatedBy: .equal, toItem: tabView, attribute: .height, multiplier: 7/1, constant: 0)]
        
        stackViewTabBar.translatesAutoresizingMaskIntoConstraints = false
        
        let hStackViewTabBar = "H:|-0-[stackViewTabBar]-0-|"
        let vStackViewTabBar = "V:|-0-[stackViewTabBar(tabView_height)]-0-|"
        constraints += NSLayoutConstraint.constraints(withVisualFormat: hStackViewTabBar, options: .alignAllTop, metrics: metrix, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: vStackViewTabBar, options: .alignAllLeading, metrics: metrix, views: views)
        
        
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    private func moveViewController(index:Int) {
        guard currentIndex != index else { return }
        if currentIndex < index {
            pageController?.setViewControllers([collection_ofVC[index]], direction: .forward, animated: false, completion: nil)
            
        } else {
            pageController?.setViewControllers([collection_ofVC[index]], direction: .reverse, animated: false, completion: nil)
            
        }
        currentIndex = index
    }
    
    @objc private func moveToMap() {
        resetButton()
        buttonMap.tintColor = UIColor(red: CGFloat(10/255), green: CGFloat(255/255), blue: CGFloat(255/255), alpha: 1)
        moveViewController(index: 0)
    }
    
    @objc private func moveToHome() {
        resetButton()
        buttonHome.tintColor = UIColor(red: CGFloat(10/255), green: CGFloat(255/255), blue: CGFloat(255/255), alpha: 1)
        moveViewController(index: 1)
    }
    
    @objc private func moveToExercise() {
        resetButton()
        buttonExercise.tintColor = UIColor(red: CGFloat(10/255), green: CGFloat(255/255), blue: CGFloat(255/255), alpha: 1)
        moveViewController(index: 2)
    }

}

extension HomeTabViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
//        guard completed, let index = collection_ofVC.firstIndex(where: {$0 == pageViewController.viewControllers?.first}) else { return }
//        currentIndex = index
    }
}

extension HomeTabViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        if let index = collection_ofVC.firstIndex(of: viewController) {
//            if index > 0 {
//                return collection_ofVC[index - 1]
//            } else {
//                return nil
//            }
//        }
//
//        return nil
        return UIViewController()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        if let index = collection_ofVC.firstIndex(of: viewController) {
//            if index < collection_ofVC.count - 1 {
//                return collection_ofVC[index + 1]
//            } else {
//                return nil
//            }
//        }
//
//        return nil
        return UIViewController()
    }
    
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return self.collection_ofVC.count
//    }
//
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        return self.currentIndex
//    }
    
}
extension HomeTabViewController {
    func resetButton() {
        buttonHome.tintColor = .gray
        buttonMap.tintColor = .gray
        buttonExercise.tintColor = .gray
    }
}
