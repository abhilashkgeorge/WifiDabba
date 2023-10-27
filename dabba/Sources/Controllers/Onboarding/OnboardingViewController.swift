//
//  OnboardingViewController.swift
//  dabba
//
//  Created by Abhilash K George on 25/10/23.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var continueButton: UIButton!
    
    var slides: [OnboardingSlide] = []
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupSlides()

        // Do any additional setup after loading the view.
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setupSlides() {
        slides = [
            OnboardingSlide(title: "Dabba Pro", description: "The most powerful consumer wifi router. Ever.", image: UIImage(named: ImageConstants.dabbaPro) ?? UIImage()),
                    OnboardingSlide(title: "Dabba Lite", description: "Low cost public wifi router for the emerging markets.", image: UIImage(named: ImageConstants.dabbaLite) ?? UIImage()),
                    OnboardingSlide(title: "Dabba Laser", description: "Core network grid that will connect an entire city", image: UIImage(named: ImageConstants.laser) ?? UIImage())
                ]
    }
    

    @IBAction func continueButtonClicked(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Login", bundle: nil)
        let viewController = storyBoard.instantiateViewController(identifier: "LoginNC") as! UINavigationController
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve
        present(viewController, animated: true)
    }
    
}


extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slide: slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let scrollWidth = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / scrollWidth)
        pageController.currentPage = currentPage
    }
}
