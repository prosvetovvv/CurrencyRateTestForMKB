//
//  MainTableVC.swift
//  CurrencyRateTestForMKB
//
//  Created by Vitaly Prosvetov on 17.05.2021.
//

import UIKit

class RateVC: UIViewController {
    private let rateViewModel: RateViewModel
    private let rootView = RateView()
    private var rates = [FormattedRate]()
    
    // MARK: - Init
    
    init(viewModel: RateViewModel) {
        self.rateViewModel = viewModel
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
        
        rateViewModel.fetch()
        rateViewModel.onRateUpdate = {
            self.rates = self.rateViewModel.rates
            self.rootView.tableView.reloadData()
        }
        
        
//        NetworkService.shared.getExchangeRates { result in
//            switch result {
//            case .success(let rates):
//                DispatchQueue.main.async {
//                    self.rates = self.makeFormattedRates(from: rates)
//                    self.rootView.tableView.reloadData()
//                }
//            case .failure(let error):
//                self.presentCRAlertOnMainThread(title: "Что-то пошло не так", message: error.rawValue, buttonTitle: "Ok", completionHandler: nil)
//            }
//        }
    }
    
//    private func makeFormattedRates(from rates: [Rate]) -> [FormattedRate] {
//        var result = [FormattedRate]()
//
//        rates.forEach {
//            let formattedRate = FormattedRate(with: $0)
//            result.append(formattedRate)
//        }
//
//        return result
//    }
}

// MARK: - Extensions

extension RateVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rate = rates[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: RateCell.reuseID, for: indexPath) as! RateCell
        
        cell.set(with: rate)
        
        return cell
    }
}

extension RateVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentRate = rates[indexPath.row]
        let detailVC = DetailVC(rate: currentRate)
        
        detailVC.modalPresentationStyle = .overFullScreen
        detailVC.modalTransitionStyle = .crossDissolve
        present(detailVC, animated: true)
    }
}
