//
//  RecoCollectionView.swift
//  CineTime
//
//  Created by Leonardo Gomes on 11/06/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import UIKit

class RecoCollectionView: UICollectionView, UICollectionViewDelegate {
    
    let flowLayout = ZoomAndSnapFlowLayout()
    var context = CIContext(options: nil)

    private let movies: [Movie] = [Movie(posterName: "1"), Movie(posterName: "2"), Movie(posterName: "3")]
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.dataSource = self
        self.delegate = self
        self.reloadData()
        
        self.decelerationRate = .fast // uncomment if necessary
        self.contentInsetAdjustmentBehavior = .always
        self.register(MoviePosterCell.self, forCellWithReuseIdentifier: "RecoCell")
        self.isPagingEnabled = false
        self.showsHorizontalScrollIndicator = false
        self.contentOffset.x = flowLayout.itemSize.width + flowLayout.minimumLineSpacing
        
        let image1 = UIImageView()
        self.backgroundView = image1
        image1.image = UIImage(named: movies[1].posterName)
        image1.alpha = 0.3
        image1.contentMode = .scaleAspectFill
        blurEffect(bg: image1, context: context)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecoCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecoCell", for: indexPath) as! MoviePosterCell
        cell.movie = movies[indexPath.item]
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let center = CGPoint(x: self.center.x + self.contentOffset.x, y: self.center.y + self.contentOffset.y)
        let indexPath = indexPathForItem(at: center)
        let image =  UIImageView(image: UIImage(named: movies[indexPath!.item].posterName))
        self.backgroundView = image
        image.alpha = 0.3
        image.contentMode = .scaleAspectFill
        blurEffect(bg: image, context: context)
    }
}
