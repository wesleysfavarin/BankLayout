//
//  HomeViewController.swift
//  AppLayout
//
//  Created by mac on 07/04/19.
//  Copyright © 2019 Wesley S. Favarin. All rights reserved.
//

import UIKit
import Segmentio
/// protocol HomeViewControllerProtocol
protocol HomeViewControllerProtocol: BaseViewControllerProtocol,UICollectionViewDelegateFlowLayout {
    var onGoToB: (() -> Void)? { get set }
    var onGoToProfile: (() -> Void)? { get set }
    
}

/// class HomeViewController: UIViewController, HomeViewControllerProtocol
class HomeViewController: UIViewController, HomeViewControllerProtocol, UITableViewDataSource, UITableViewDelegate  {
   
    
    var onGoToB: (() -> Void)?
    var onGoToProfile: (() -> Void)?
   /// criacao de uma instancia da view model
    var viewModel: HomeViewModelProtocol?
    let cellId = "cellId"
     var segmentioStyle = SegmentioStyle.imageOverLabel
    /// IBoulets
    
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tabbed: Segmentio!
    @IBOutlet weak var tabCards: Segmentio!
    /// ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        /// seta o titulo da pagina
        navigationItem.title = "Accounts"
        
        /// remove o navigation bar para setar uma imagem customizada
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupTab()
        setupTabCards()
    }
    
    
    @IBAction func details(_ sender: Any) {
        self.onGoToB?()
    }
    //MARK:Table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        return cell
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    @IBAction func onGoToCartoes(_ sender: Any) {
        self.onGoToB?()
    }
    //MARK: TABs
    func setupTab(){
        SegmentioBuilder.buildSegmentioView(
            segmentioView: tabCards,
            segmentioStyle: segmentioStyle
        )
        SegmentioBuilder.setupBadgeCountForIndex(tabCards, index: 0)
        
        tabCards.valueDidChange = { [weak self] _, segmentIndex in
            if let scrollViewWidth = self?.scrollView.frame.width {
                let contentOffsetX = scrollViewWidth * CGFloat(segmentIndex)
                self?.scrollView.setContentOffset(
                    CGPoint(x: contentOffsetX, y: 0),
                    animated: true
                )
            }
        }
        tabbed.selectedSegmentioIndex = selectedSegmentioIndex()
    }
    
    func setupTabCards(){
        //MARK: Tab cards
        TabCards.buildCardsView(
            segmentioView: tabbed,
            segmentioStyle: segmentioStyle
        )
        TabCards.setupBadgeCountForIndex(tabbed, index: 0)
        
        tabbed.valueDidChange = { [weak self] _, segmentIndex in
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
    
    private func selectedSegmentioIndex() -> Int {
        return 0
    }
}
extension HomeViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = floor(scrollView.contentOffset.x / scrollView.frame.width)
        tabbed.selectedSegmentioIndex = Int(currentPage)
        tabCards.selectedSegmentioIndex = Int(currentPage)
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: 0)
    }
}
