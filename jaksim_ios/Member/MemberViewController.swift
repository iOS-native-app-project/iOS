//
//  MemberViewController.swift
//  jaksim_ios
//
//  Created by 소영 on 2022/04/14.
//

import UIKit

class MemberViewController: UIViewController {

    @IBOutlet var topImageView: UIImageView!
    @IBOutlet var tagCollectionView: UICollectionView!
    @IBOutlet var memberTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollecitonView()
        setupTableView()
    }
    

  

}
//MARK: - CollectionView
extension MemberViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCollectionViewCell", for: indexPath) as! TagCollectionViewCell
        
        return cell
    }
    
    private func setupCollecitonView() {
        tagCollectionView.delegate = self
        tagCollectionView.dataSource = self
        
        let flowLayout = UICollectionViewFlowLayout()
        tagCollectionView.collectionViewLayout = flowLayout
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 50, height: 30)
    }
    
    
}

//MARK: - TableView
extension MemberViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberTaleViewCell", for: indexPath) as! MemberTableViewCell
        
        return cell
    }
    
    private func setupTableView() {
        memberTableView.delegate = self
        memberTableView.dataSource = self
    }
    
    
    
}
