//
//  PageViewDataProvider.swift
//  ios-infinite-view-demo
//
//  Created by Eiji Kushida on 2017/05/29.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

final class PageViewDataProvider: NSObject, UIPageViewControllerDataSource {

    var imageFiles: [String] = []

    func setupImageFile(imageFiles: [String]) {
        self.imageFiles = imageFiles
    }

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return goFowardPage(viewController)
    }

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return goBackPage(viewController)
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return imageFiles.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }

    fileprivate func goBackPage(_ viewController: UIViewController) -> UIViewController? {

        var index = (viewController as! InfiniteInnerViewController).pageIndex
        if index == NSNotFound {
            return nil
        }

        if index == 0 {
            index = imageFiles.count
        }

        index -= 1
        return viewControllerAtIndex(index)
    }

    fileprivate func goFowardPage(_ viewController: UIViewController) -> UIViewController? {

        var index = (viewController as! InfiniteInnerViewController).pageIndex

        if index == NSNotFound {
            return nil;
        }
        index += 1
        if index == imageFiles.count {
            index = 0
        }
        return self.viewControllerAtIndex(index)
    }

    func viewControllerAtIndex(_ index:Int) -> InfiniteInnerViewController? {

        if imageFiles.count == 0 || index >= imageFiles.count {
            return nil
        }
        if let vc = UIStoryboard.getViewController("InfiniteInnerViewController",
                                                   identifier: "InfiniteInnerViewController") as? InfiniteInnerViewController {
            vc.pageIndex = index
            vc.filePath = imageFiles[index]
            return vc
        }
        return nil
    }
}
