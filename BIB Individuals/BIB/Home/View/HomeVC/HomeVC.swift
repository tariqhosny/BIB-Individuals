//
//  HomeVC.swift
//  BIB Individuals
//
//  Created by Tariq on 14/09/2021.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var servicesCollectionView: UICollectionView!
    @IBOutlet weak var partenersCollectionView: UICollectionView!
    
    let services = ["Medical Insurance", "Vehicle Insurance", "Medical Group"]
    let parteners = ["Axa", "Royal", "Thrwa"]
    var counter = 1
    var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        logOutBtn()
        notificationsBtn()
        setupCells()
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(changePartenerImage), userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "Home"
    }
    
    func setupCells(){
        servicesCollectionView.delegate = self
        servicesCollectionView.dataSource = self
        partenersCollectionView.delegate = self
        partenersCollectionView.dataSource = self
        
        servicesCollectionView.register(UINib(nibName: "ServiceCell", bundle: nil), forCellWithReuseIdentifier: "ServiceCell")
        partenersCollectionView.register(UINib(nibName: "PartenerCell", bundle: nil), forCellWithReuseIdentifier: "PartenerCell")
    }
    
    func logOutBtn(){
        let logOutButton = UIButton()
        logOutButton.frame = CGRect(x: 0, y: 0, width: 80, height: 30)
        logOutButton.setTitle("Log Out", for: .normal)
        logOutButton.setTitleColor(.red, for: .normal)
        logOutButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        logOutButton.addTarget(self, action: #selector(logOutTapped), for: UIControl.Event.touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logOutButton)
    }
    
    @objc func logOutTapped(){
        let alert = UIAlertController(title: "Log Out", message: "Are you sure want to logout?", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Log Out", style: .destructive, handler: { (action) in
            let defUser = UserDefaults.standard
            defUser.removeObject(forKey: "userEmail")
            defUser.removeObject(forKey: "username")
            Helper.restart()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func notificationsBtn(){
        let notificationsButton = UIButton()
        notificationsButton.frame = CGRect(x: 0, y: 0, width: 50, height: 35)
        notificationsButton.setImage(UIImage(systemName: "bell.fill"), for: .normal)
        notificationsButton.tintColor = .gray
        notificationsButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        notificationsButton.addTarget(self, action: #selector(notificationsTapped), for: UIControl.Event.touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: notificationsButton)
    }
    
    @objc func notificationsTapped(){
        
    }
    
    @objc func changePartenerImage() {
        if counter < parteners.count {
            let index = IndexPath(item: counter, section: 0)
            partenersCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            counter += 1
        }else {
            counter = 0
            let index = IndexPath(item: counter, section: 0)
            partenersCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            counter = 1
        }
    }
    
}
