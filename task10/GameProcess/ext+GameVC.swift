//
//  ext+GameVC.swift
//  task10
//
//  Created by Anna Ershova on 30.08.2021.
//

import UIKit

extension GameProcessVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cv.frame.width / 1.3, height: cv.frame.height / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        parentVC!.players.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as! GameCell
        cell.backgroundColor = timer.textColor
        //cell.addGestureRecognizer(.touchesBegan(.))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20 * parentVC!.multiplier
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 46 * parentVC!.multiplier, bottom: 160 * parentVC!.multiplier, right: 46 * parentVC!.multiplier)
    }
    
//    func indexTitles(for collectionView: UICollectionView) -> [String]? {
//        let arr: [String] = parentVC!.players
//        let res: Array<String> = arr.map({ String($0.prefix(1)) })
//        return res
//    }

//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = cv.cellForItem(at: indexPath)
        size = CGSize(width: cell!.frame.width, height: cell!.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width - (scrollView.contentInset.left * 2)
        let index = scrollView.contentOffset.x / witdh
        let roundedIndex = round(index)
        currentTitle = pageSrack.arrangedSubviews[Int(roundedIndex)] as! UILabel
        currentTitle.textColor = .white
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let x = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        currentTitle = pageSrack.arrangedSubviews[Int(x)] as! UILabel
        cv.isScrollEnabled = true
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let x = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        currentTitle = pageSrack.arrangedSubviews[Int(x)] as! UILabel
    }

    
}
