//
//  MapViewController.swift
//  bukanDigiSaham
//
//  Created by Mac on 15/03/21.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    let mapView = MKMapView()
    let labelMapTitle = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        addLayout()
        addConstraints()
        
        // Do any additional setup after loading the view.
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
        addMapView()
        addLabelMapTitle()
    }
    
    private func addMapView() {
        self.view.addSubview(mapView)
    }
    
    private func addLabelMapTitle() {
        labelMapTitle.text = "Map"
        labelMapTitle.textColor = UIColor(red: CGFloat(20/255), green: CGFloat(20/255), blue: CGFloat(20/255), alpha: 1)
        labelMapTitle.font = UIFont.boldSystemFont(ofSize: 36)
        view.addSubview(labelMapTitle)
        
    }
    
    private func addConstraints() {
        
        
        
        let views = ["mapView":mapView,"labelMapTitle":labelMapTitle]
        let metrix:[String:Any] = [:]
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        let hMapView = "H:|-0-[mapView]-0-|"
        let vMapView = "V:|-0-[mapView]-0-|"
        
        var constraints = [NSLayoutConstraint]()
        
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: hMapView, options: .alignAllTop, metrics: metrix, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: vMapView, options: .alignAllLeading, metrics: metrix, views: views)
        
        labelMapTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let hLabelMapTitle = "H:|-25-[labelMapTitle(100)]"
        let vLabelMapTitle = "V:|-50-[labelMapTitle(40)]"
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: hLabelMapTitle, options: .alignAllTop, metrics: metrix, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: vLabelMapTitle, options: .alignAllLeading, metrics: metrix, views: views)
        
        
        NSLayoutConstraint.activate(constraints)
        
    }
    

}
