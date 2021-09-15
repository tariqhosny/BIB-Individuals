//
//  HomeVC+Extensions.swift
//  BIB Individuals
//
//  Created by Tariq on 15/09/2021.
//

import UIKit

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == servicesCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCell", for: indexPath) as! ServiceCell
            if indexPath.item == 0{
                cell.commingSoonView.isHidden = true
            }
            cell.serviceImage.image = UIImage(named: services[indexPath.item])
            cell.serviceNameLb.text = services[indexPath.item]
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PartenerCell", for: indexPath) as! PartenerCell
            cell.partenerImage.image = UIImage(named: parteners[indexPath.item])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == servicesCollectionView{
            let width = collectionView.frame.width / 3 - 10
            return CGSize(width: width, height: 130)
        }else{
            return CGSize(width: collectionView.frame.width, height: 100)
        }
    }
    
}
