//
//  HomeVC.swift
//  PirateAppStore
//
//  Created by Nick on 7/9/19.
//  Copyright © 2019 nicksdev. All rights reserved.
//

import UIKit

class HomeVC: UIViewController  {
    
    // MARK: - Properties
    @IBOutlet weak var pageView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    var pageViewVC: UIPageViewController?
    let imageArray = ["piratebattle", "piratemap", "piratesofcaribbean"]
    var currentIndex = 0
    
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(HomeVC.loadNextController), userInfo: nil, repeats: true)

        setPageVC()
    }
    
    
    
    // MARK: - IBaction
    
    
    
    
    
    // MARK: - Private Functions
    private func setPageVC(){
        let pageVC = self.storyboard?.instantiateViewController(withIdentifier: "promoPageVC") as! UIPageViewController
        
        pageVC.dataSource = self
        
        let firstController = getViewController(atIndex: 0)
        
        pageVC.setViewControllers([firstController], direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
        
        self.pageViewVC = pageVC
        
        self.addChild(self.pageViewVC!)
        
        self.pageView.addSubview(self.pageViewVC!.view)
        
        self.pageViewVC?.didMove(toParent: self)
        
    }
    
    fileprivate func getViewController(atIndex index: Int)-> PromoContentVC{
        let promoContentVC = self.storyboard?.instantiateViewController(withIdentifier: "promoContentVC") as! PromoContentVC
        
        promoContentVC.imageName = imageArray[index]
        promoContentVC.pageIndex = index
        
        return promoContentVC
        
    }

    @objc private func loadNextController(){
        currentIndex += 1
        if currentIndex == imageArray.count{
            currentIndex = 0
        }
        let nextController = getViewController(atIndex: currentIndex)
        self.pageViewVC?.setViewControllers([nextController], direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
        
        self.pageControl.currentPage = currentIndex
    }
    
    
    
    
    


    

    
}

// MARK: - Private Functions
extension HomeVC: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let pageContentVC = viewController as! PromoContentVC
        var index = pageContentVC.pageIndex
        
        if index == 0 || index == NSNotFound {
            
            return getViewController(atIndex: imageArray.count - 1)
            
        }
        index -= 1
        
        return getViewController(atIndex: index)
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let pageContentVC = viewController as! PromoContentVC
        var index = pageContentVC.pageIndex
        
            if index == NSNotFound{
                return nil
            }
            index += 1
        
        if index == imageArray.count{
            return getViewController(atIndex: 0)
            
        }
        return getViewController(atIndex: index)
    }
}
