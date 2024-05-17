//
//  HomeVC.swift
//  NewsApp
//
//  Created by M Usman on 17/05/2024.
//

import UIKit
import Combine

class HomeVC: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView:UITableView!
    
    
    // MARK: - Variables and Constant
    var viewModel = HomeViewModel()
    var bindings = Set<AnyCancellable>()
    
    
    //MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBindings()
        viewModel.fetchPopularNews()
        tableView.register(UINib(nibName: "NewsTableCell", bundle: nil), forCellReuseIdentifier: "NewsTableCell")
        tableView.dataSource = self
        tableView.delegate = self
        self.navigationItem.title = "Popular News"
    }
    
    
    // MARK: - IBActions
    
    
    // MARK: - Helper Methods
    
    
    // MARK: - #Selectors
    
    // MARK: - User Methods
    
    private func setUpBindings(){
        func bindViewToViewModel() {
        }
        func bindViewModelToView(){
            viewModel.$news
                .receive(on: DispatchQueue.main)
                .sink { _ in
                        self.tableView.reloadData()
                }.store(in: &bindings)
        }
        bindViewModelToView()
        bindViewToViewModel()
    }
}
extension HomeVC : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.news.count == 0 {
            let rowHeight : CGFloat = 95
            return Int(tableView.bounds.height/rowHeight) + 1
             
        }
        return viewModel.news.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableCell", for: indexPath) as? NewsTableCell else{return UITableViewCell()}
        if viewModel.news.count == 0 {
            cell.addShimmerEffect()
        }else{
            cell.setData(news: viewModel.news[indexPath.row])
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if viewModel.news.count == 0 {
            return
        }
        if let vc = AppConstant.mainStoryBoard.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC {
            vc.viewModel.news = viewModel.news[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
