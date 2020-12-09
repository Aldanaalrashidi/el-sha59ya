//
//  CellLayout.swift
//  الشخصية
//
//  Created by Aldana Al Rashidi on 25/11/2020.
//

import UIKit

class CellLayout: UICollectionViewLayout {
    // MARK: - Layout configuration
    public var itemSize: CGSize = CGSize(width: 250, height: 400) {
        didSet{
            if collectionView != nil {
                invalidateLayout()
            }
        }
    }
    
    public var spacing: CGFloat = 16.0 {
        didSet{
            if collectionView != nil {
                invalidateLayout()
            }
        }
    }
    
    public var maximumVisibleItems: Int = 4 {
        didSet{
            if collectionView != nil {
                invalidateLayout()
            }
        }
    }
    
}

// MARK: UICollectionViewLayout
extension CellLayout {
    override open func prepare() {
        super.prepare()
        assert(collectionView?.numberOfSections == 1, "Multiple sections aren't supported!")
    }
    
    override open var collectionViewContentSize: CGSize {
        if collectionView == nil { return CGSize.zero }
        
        let itemsCount = CGFloat(collectionView!.numberOfItems(inSection: 0))
        return CGSize(width: collectionView!.bounds.width * itemsCount,
                      height: collectionView!.bounds.height)
    }
    
    override open func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        if collectionView == nil { return nil }
        
        let totalItemsCount = collectionView!.numberOfItems(inSection: 0)
        let minVisibleIndex = max(0, Int(collectionView!.contentOffset.x) / Int(collectionView!.bounds.width))
        let maxVisibleIndex = min(totalItemsCount, minVisibleIndex + maximumVisibleItems)
        
        let contentCenterX = collectionView!.contentOffset.x + collectionView!.bounds.width / 2
        let deltaOffset = Int(collectionView!.contentOffset.x) % Int(collectionView!.bounds.width)
        let percentageDeltaOffset = CGFloat(deltaOffset) / collectionView!.bounds.width
        
        var attributes = [UICollectionViewLayoutAttributes]()
        for i in minVisibleIndex..<maxVisibleIndex {
            let attribute = computeLayoutAttributesForItem(indexPath: IndexPath(item: i, section: 0),
                                                           minVisibleIndex: minVisibleIndex,
                                                           contentCenterX: contentCenterX,
                                                           deltaOffset: CGFloat(deltaOffset),
                                                           percentageDeltaOffset: percentageDeltaOffset)
            attributes.append(attribute)
        }

        return attributes
    }
    
    override open func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}

// MARK: - compute layout
extension CellLayout {
    
    func computeLayoutAttributesForItem(indexPath: IndexPath,
                                        minVisibleIndex: Int,
                                        contentCenterX: CGFloat,
                                        deltaOffset: CGFloat,
                                        percentageDeltaOffset: CGFloat) -> UICollectionViewLayoutAttributes {
        if collectionView == nil { return UICollectionViewLayoutAttributes(forCellWith:indexPath)}
        
        let attributes = UICollectionViewLayoutAttributes(forCellWith:indexPath)
        let cardIndex = indexPath.row - minVisibleIndex
        attributes.size = itemSize
        attributes.center = CGPoint(x: contentCenterX + spacing * CGFloat(cardIndex),
                                    y: collectionView!.bounds.midY + spacing * CGFloat(cardIndex))
        attributes.zIndex = maximumVisibleItems - cardIndex
        
        switch cardIndex {
        case 0:
            attributes.center.x -= deltaOffset
            
        case 1..<maximumVisibleItems:
            attributes.center.x -= spacing * percentageDeltaOffset
            attributes.center.y -= spacing * percentageDeltaOffset
            
            if cardIndex == maximumVisibleItems - 1 {
                attributes.alpha = percentageDeltaOffset
            }
            
        default: break
            
        }
        return attributes
    }
}
