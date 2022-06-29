//
//  ViewController.swift
//  MagicTheGatheringCards
//
//  Created by Ilya Volkov on 28.06.2022.
//

import UIKit
import Alamofire

class CardController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Variables
    
    private var cards: [Card] = []
    
    //MARK: - UI

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CardsTableViewCell.self, forCellReuseIdentifier: CardsTableViewCell.identifier)
        return tableView
    }()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupLayout()
        
        fetchCards()
    }
    
    //MARK: - Settings
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func fetchCards() {
        AF.request("https://api.magicthegathering.io/v1/cards")
            .validate()
            .responseDecodable(of: Cards.self) { (response) in
                guard let responseCard = response.value else { return }
                self.cards = responseCard.cards
                print(response)
                
                self.tableView.reloadData()
            }
    }
    
    //MARK: - UITableView methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = cards[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CardsTableViewCell.identifier,
            for: indexPath) as? CardsTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }
}

