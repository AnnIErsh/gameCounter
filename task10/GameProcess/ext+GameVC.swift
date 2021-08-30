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
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20 * parentVC!.multiplier
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 46 * parentVC!.multiplier, bottom: 160 * parentVC!.multiplier, right: 46 * parentVC!.multiplier)
    }
        
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        targetContentOffset.pointee = scrollView.contentOffset
        var indexes = cv.indexPathsForVisibleItems
        indexes.sort()
        var index = indexes.first!
        let cell = cv.cellForItem(at: index)!
        let position = cv.contentOffset.x - cell.frame.origin.x
        if position > cell.frame.size.width / 2 {
           index.row = index.row + 1
        }
        cv.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        currentTitle = pageSrack.arrangedSubviews[index.row] as! UILabel
        currentTitle.textColor = .white
        checkArrows(index)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cv.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        currentTitle = pageSrack.arrangedSubviews[indexPath.row] as! UILabel
        currentTitle.textColor = .white
        checkArrows(indexPath)
    }
}


