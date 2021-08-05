//
//  ViewController.swift
//  SampleUI_Version2
//
//  Created by Akanksha Gupta on 26/07/21.
//


import UIKit

class ProductListViewController: UIViewController {
    
    private var productViewModel = ProductListViewModel()
    
    
    private var tableView : UITableView = {
        let myTableView = UITableView()
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        return myTableView
    }()
    
//    var productDetail = [Products]()
    
     override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        styleView()
         
         productViewModel.apiCall {
             DispatchQueue.main.async {
                 self.tableView.reloadData()
             }
         }
         
    }
}

extension ProductListViewController {
    private func setUpTableView() {
        tableView.register(ProductCell.self, forCellReuseIdentifier: String(describing: ProductCell.self))
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func styleView() {

        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}

extension ProductListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductCell.self)) as! ProductCell
        cell.configure(with: productViewModel.getCellModel(indexPath: indexPath))
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}

