//
//  ModulView.swift
//  CleanCodeArchitecture
//
//  Created by Vicky Irwanto on 28/02/24.
//

import Foundation
import UIKit
import SDWebImage

class ModulViewController: UIViewController, PTVModulViewProtocol, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var presenter: PTPModulPresenterProtocol?
    
    var userFollowersData = [UserFollowers]()
    var userDetails: UserFollowers?
    
    private var table: UITableView = {
        let table = UITableView()
        table.isHidden = true
        return table
    }()
    
    private var progressView: UIActivityIndicatorView = {
        let progress = UIActivityIndicatorView()
        progress.color = .black
        progress.startAnimating()
        return progress
    }()
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.isHidden = true
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    
        setProtocol()
        setView()
    }
    
    override func viewDidLayoutSubviews() {
        progressView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        progressView.center = view.center
        setConstraints()
    }
    
    func setProtocol(){
        table.delegate = self
        table.dataSource = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CustomCollection.self, forCellWithReuseIdentifier: "cell")
    }
    
    func setView() {
        view.addSubview(progressView)
        view.addSubview(collectionView)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ])
    }
    
    func getDataSucces(with data: [UserFollowers]) {
        DispatchQueue.main.async {
            // closure
            var _: (UserFollowers) -> Bool = { data in
                if data.login == "ziterz" || data.login == "amarafiif"{
                    return true
                }else {
                    return false
                }
            }
            
            self.progressView.stopAnimating()
            self.collectionView.isHidden = false
            self.userFollowersData = data
            self.collectionView.reloadData()
            // trailing closure
            let result = self.userFollowersData.filter{$0.login == "amarafiif"}
            
            print(result)
        }
        
    }
    
    func getDataFail(with error: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Alert", message: "\(error)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true)
        }
        
    }
    
    func getUserDetail(with data: UserFollowers) {
        self.userDetails = data
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userFollowersData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = userFollowersData[indexPath.row].login
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userFollowersData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollection
        guard let url = URL(string: userFollowersData[indexPath.row].avatar_url) else {return cell}
//        cell.circleImage.sd_setImage(with: url, placeholderImage: UIImage(named: "thumbnail"))
        cell.circleImage.loadImageFromUrl(from: url)
        cell.lblCollection.text = self.userFollowersData[indexPath.row].login
      
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 150)
    }
}
