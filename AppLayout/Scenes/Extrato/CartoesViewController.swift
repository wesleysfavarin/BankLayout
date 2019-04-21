//
//  CartoesViewController.swift
//  AppLayout
//
//  Created by mac on 07/04/19.
//  Copyright © 2019 Wesley S. Favarin. All rights reserved.
//

import UIKit
import Segmentio
protocol CartoesViewControllerProtocol: class {
    var onBack: (() -> Void)? { get set }
    var onCartoes: (() -> Void)? { get set }
}

protocol CartoesViewControllerDelegate: class {
    func didSelectDate(date: Date)
}

class CartoesViewController: UIViewController,CartoesViewControllerProtocol {
    var segmentioStyle = SegmentioStyle.imageOverLabel
    @IBOutlet weak var segmentioView: Segmentio!
    
    
    @IBOutlet weak var tabCards: Segmentio!
    @IBOutlet var containerView: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detalhes"
        
        if let navController = navigationController {
            System.clearNavigationBar(forBar: navController.navigationBar)
            navController.view.backgroundColor = .clear
        }
        
        navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        
        /// configura animaçao para exibicao das imagens dos cartoes na tea
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
//    class func create() -> CartoesViewController {
//        let board = UIStoryboard(name: "Cartoes", bundle: nil)
//        return board.instantiateViewController(withIdentifier: String(describing: self)) as! CartoesViewController
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        SegmentioBuilder.buildSegmentioView(
            segmentioView: segmentioView,
            segmentioStyle: segmentioStyle
        )
        SegmentioBuilder.setupBadgeCountForIndex(segmentioView, index: 0)
        
        segmentioView.valueDidChange = { [weak self] _, segmentIndex in
            if let scrollViewWidth = self?.scrollView.frame.width {
                let contentOffsetX = scrollViewWidth * CGFloat(segmentIndex)
                self?.scrollView.setContentOffset(
                    CGPoint(x: contentOffsetX, y: 0),
                    animated: true
                )
            }
        }
        segmentioView.selectedSegmentioIndex = selectedSegmentioIndex()
        
        //MARK: Tab cards
        TabCards.buildCardsView(
            segmentioView: tabCards,
            segmentioStyle: segmentioStyle
        )
        TabCards.setupBadgeCountForIndex(tabCards, index: 0)
        
        tabCards.valueDidChange = { [weak self] _, segmentIndex in
            if let scrollViewWidth = self?.scrollView.frame.width {
                let contentOffsetX = scrollViewWidth * CGFloat(segmentIndex)
                self?.scrollView.setContentOffset(
                    CGPoint(x: contentOffsetX, y: 0),
                    animated: true
                )
            }
        }
        tabCards.selectedSegmentioIndex = selectedSegmentioIndex()
    }
    
    var onBack: (() -> Void)?
    var onCartoes: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    private func selectedSegmentioIndex() -> Int {
        return 0
    }
    // MARK: - Setup container view
}
extension CartoesViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = floor(scrollView.contentOffset.x / scrollView.frame.width)
        segmentioView.selectedSegmentioIndex = Int(currentPage)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: 0)
    }
}
