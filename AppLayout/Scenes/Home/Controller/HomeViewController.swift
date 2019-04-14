//
//  HomeViewController.swift
//  AppLayout
//
//  Created by mac on 07/04/19.
//  Copyright © 2019 Wesley S. Favarin. All rights reserved.
//

import UIKit
import Segmentio
import ScalingCarousel
/// protocol HomeViewControllerProtocol
protocol HomeViewControllerProtocol: BaseViewControllerProtocol,UICollectionViewDelegateFlowLayout {
    var onGoToB: (() -> Void)? { get set }
    var onGoToProfile: (() -> Void)? { get set }
    
}
/// class Cell: ScalingCarouselCell
class Cell: ScalingCarouselCell {
        
}
/// class HomeViewController: UIViewController, HomeViewControllerProtocol
class HomeViewController: UIViewController, HomeViewControllerProtocol {
    var onGoToB: (() -> Void)?
    var onGoToProfile: (() -> Void)?
   /// criacao de uma instancia da view model
    var viewModel: HomeViewModelProtocol?
    
    /// IBoulets
    @IBOutlet weak var carousel: ScalingCarouselView!
    @IBOutlet weak var seguientioView: Segmentio!
    
    @IBOutlet weak var scrollView: UIScrollView!
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

        //navigationController?.navigationBar.setBackgroundImage(img, for: .default)
       // UINavigationBar.appearance().setBackgroundImage(UIImage(named: "background")!.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch), for: .default)
//        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
//        titleLabel.text = "Accounts"
//        titleLabel.textColor = .white
//        titleLabel.font = UIFont.systemFont(ofSize: 20)
//        navigationItem.titleView = titleLabel
        
        /// condigura o tabbar header
        setup()
        /// configura animaçao para exibicao das imagens dos cartoes na tea
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        carousel.deviceRotated()
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
typealias CarouselDatasource = HomeViewController
extension CarouselDatasource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        if let scalingCell = cell as? ScalingCarouselCell {
            //cell.main
            //scalingCell.mainView?.backgroundColor = .red
            
            
            //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "c1")!)
            scalingCell.mainView?.backgroundColor =  UIColor(patternImage: UIImage(named: "c1")!)
           // scalingCell.mainView?.backgroundColor =  UIColor(patternImage: UIImage(named: "background")!)
            //scalingCell.mainView?.backgroundColor =  UIColor(patternImage: UIImage(named: "logo")!)
            
        }
        
        DispatchQueue.main.async {
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
        }
        
        return cell
    }
}

typealias CarouselDelegate = HomeViewController
extension HomeViewController: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //carousel.didScroll()
        
        guard let currentCenterIndex = carousel.currentCenterCellIndex?.row else { return }
        
        //output.text = String(describing: currentCenterIndex)
    }
}

private typealias ScalingCarouselFlowDelegate = HomeViewController
extension ScalingCarouselFlowDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
}

