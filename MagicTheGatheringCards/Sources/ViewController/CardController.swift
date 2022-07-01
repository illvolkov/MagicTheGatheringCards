//
//  ViewController.swift
//  MagicTheGatheringCards
//
//  Created by Ilya Volkov on 28.06.2022.
//

import UIKit
import Alamofire

final class CardController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Variables
    
    private var cards: [Displayable] = []
    private var selectedItem: Displayable?
    
    //MARK: - Views

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
        setupView()
        
        fetchCards()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBar()
    }
    
    //MARK: - Settings
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Offsets.leftOffset15).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Offsets.leftOffset15).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupView() {
        view.backgroundColor = .white
        title = Strings.viewTitle
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = Colors.indigoColor
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
    }
    
    //MARK: - Request
    
    private func fetchCards() {
        
        let url = Strings.mtgCardsPath
        let parameters = [Strings.parameterRandomName: Strings.parameterRandomValue]
        
        AF.request(url, parameters: parameters)
            .validate()
            .responseDecodable(of: Cards.self) { (response) in
                guard let responseCard = response.value else { return }
                self.cards = responseCard.cards
                
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
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = cards[indexPath.row]
        let detailViewController = DetailCardController(data: selectedItem)
        present(detailViewController, animated: true)
    }
}

