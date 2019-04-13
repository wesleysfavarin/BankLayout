//
//  HomeViewController.swift
//  AppLayout
//
//  Created by mac on 07/04/19.
//  Copyright © 2019 Wesley S. Favarin. All rights reserved.
//

import UIKit
import Segmentio

protocol HomeViewControllerProtocol: BaseViewControllerProtocol,UICollectionViewDelegateFlowLayout {
    var onGoToB: (() -> Void)? { get set }
    var onGoToProfile: (() -> Void)? { get set }
    
}

class HomeViewController: UIViewController, HomeViewControllerProtocol {
    var onGoToB: (() -> Void)?
    
    var onGoToProfile: (() -> Void)?
    
    var viewModel: HomeViewModelProtocol?
    
    @IBOutlet weak var seguientioView: Segmentio!
    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Accounts"
        
        if let navController = navigationController {
            System.clearNavigationBar(forBar: navController.navigationBar)
            navController.view.backgroundColor = .clear
        }
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        //navigationController?.navigationBar.setBackgroundImage(img, for: .default)
       // UINavigationBar.appearance().setBackgroundImage(UIImage(named: "background")!.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch), for: .default)
//        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
//        titleLabel.text = "Accounts"
//        titleLabel.textColor = .white
//        titleLabel.font = UIFont.systemFont(ofSize: 20)
//        navigationItem.titleView = titleLabel
        
        setup()
    }
    
    
    func setup(){
     seguientioView.selectedSegmentioIndex = 0
        
        seguientioView.valueDidChange = { segmentio, segmentIndex in
            print("Selected item: ", segmentIndex)
        }
        
    let opt = SegmentioOptions(
            backgroundColor: .clear,
            segmentPosition:  SegmentioPosition.fixed(maxVisibleItems: 12),
           scrollEnabled: true,
           indicatorOptions:  SegmentioIndicatorOptions(
            type: .bottom,
            ratio: 1,
            height: 5,
            color: .white
        ),
            horizontalSeparatorOptions: SegmentioHorizontalSeparatorOptions(
                type: SegmentioHorizontalSeparatorType.topAndBottom, // Top, Bottom, TopAndBottom
                height: 1,
                color: .clear
            ),
            verticalSeparatorOptions: SegmentioVerticalSeparatorOptions(
                ratio: 0.0, // from 0.1 to 1
                color: .clear
            ),
            imageContentMode: .center,
            labelTextAlignment: .center,
            segmentStates: SegmentioStates(
                defaultState: SegmentioState(
                    backgroundColor: UIColor.lightGray.withAlphaComponent(0.6),
                    titleFont: UIFont.boldSystemFont(ofSize: 12),
                    titleTextColor: .lightGray
                ),
                selectedState: SegmentioState(
                    backgroundColor: .clear,
                    titleFont: UIFont.boldSystemFont(ofSize: 12),
                    titleTextColor: .white
                ),
                highlightedState: SegmentioState(
                    backgroundColor: UIColor.lightGray.withAlphaComponent(0.6),
                    titleFont: UIFont.boldSystemFont(ofSize: 12),
                    titleTextColor: .lightGray
                )
            )
        )
        
        seguientioView.setup(
            content: [SegmentioItem.init(title: "Account list", image: nil),SegmentioItem.init(title: "History", image: nil),SegmentioItem.init(title: "Statements", image: nil),SegmentioItem.init(title: "Transfer", image: nil)],
            style: SegmentioStyle.onlyLabel,
            options: opt
        )
        
    }
    

    @IBAction func onGoToCartoes(_ sender: Any) {
        self.onGoToB?()
    }
}
