//
//  CollectionPicVC.swift
//  الشخصية
//
//  Created by Aldana Al Rashidi on 25/11/2020.
//

import UIKit
import AVFoundation

class CollectionPicVC: UIViewController, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    let imageNames = ["1", "2", "3", "4", "5", "6"]
        lazy var cardLayout: CellLayout = {
        let layout = CellLayout()
        layout.maximumVisibleItems = 4
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    fileprivate func setupView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.collectionViewLayout = cardLayout
    }

}

// MARK: UICollectionViewDataSource
extension CollectionPicVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as!PictureCell
        cell.imageName = imageNames[indexPath.row]
        cell.loadContent()
        return cell
    }
    
}
