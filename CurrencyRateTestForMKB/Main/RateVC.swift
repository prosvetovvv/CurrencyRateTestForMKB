//
//  MainTableVC.swift
//  CurrencyRateTestForMKB
//
//  Created by Vitaly Prosvetov on 17.05.2021.
//

import UIKit

protocol ShowingLoadingSpinner {
    var spinnerView: LoadingSpinnerView { get }
    
    func showSpinnerView()
}

class RateVC: UIViewController {
    private let viewModel: RateViewModel
    private let rootView = RateView()
    private var formattedRates = [FormattedRate]()
    
    // MARK: - Init
    
    init(viewModel: RateViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSelf()
        setupTableView()
        getExchangeRates()
    }
    
    // MARK: - Private
    
    private func setupSelf() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupTableView() {
        rootView.tableView.register(RateCell.self, forCellReuseIdentifier: RateCell.reuseID)
        rootView.tableView.dataSource = self
        rootView.tableView.delegate = self
    }
    
    private func getExchangeRates() {
        showSpinnerView()
        viewModel.fetch()
        viewModel.onRateUpdate = {
            self.formattedRates = self.viewModel.formattedRates
            self.rootView.tableView.reloadData()
            self.dismissSpinnerView()
        }
    }
}

// MARK: - Table view date source

extension RateVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        formattedRates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rate = formattedRates[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: RateCell.reuseID, for: indexPath) as! RateCell
        
        cell.set(with: rate)
        
        return cell
    }
}

// MARK: - Table view delegate

extension RateVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentRate = formattedRates[indexPath.row]
        let detailVC = DetailVC(rate: currentRate)
        
        detailVC.modalPresentationStyle = .overFullScreen
        detailVC.modalTransitionStyle = .crossDissolve
        present(detailVC, animated: true)
    }
}
