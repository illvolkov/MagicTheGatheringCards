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
    
    private var items: [Displayable] = []
    private var selectedItem: Displayable?
    private var cards: [Card] = []
    
    //MARK: - Views

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CardsTableViewCell.self, forCellReuseIdentifier: CardsTableViewCell.identifier)
        return tableView
    }()
    
    private lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.delegate = self
        search.showsCancelButton = true
        search.placeholder = Strings.searchBarPlaceholder
        search.tintColor = Colors.indigoColor
        return search
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = view.frame.width * Sizes.searchButtonMultiplierCornerRadius
        button.backgroundColor = Colors.indigoColor
        button.setTitle(Strings.searchButtonTitle, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: view.frame.width * Sizes.searchButtonTitleMultiplierFontSize)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var emptySearchAlert: UIAlertController = {
        let alert = UIAlertController(title: Strings.emptySearchAlertTitle,
                                      message: Strings.emptySearchAlertMessage,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: Strings.alertActionTitleOK, style: .cancel))
        return alert
    }()
    
    private lazy var cardNotFoundAlert: UIAlertController = {
        let alert = UIAlertController(title: Strings.cardNotFoundAlertTitle,
                                      message: Strings.cardNotFoundAlertMessage,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Strings.alertActionTitleOK, style: .cancel))
        return alert
    }()
    
    private lazy var networkAlert: UIAlertController = {
        let alert = UIAlertController(title: "",
                                      message: "",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Strings.alertActionTitleOK, style: .cancel))
        return alert
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
        view.addSubview(searchBar)
        view.addSubview(searchButton)
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        searchBar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: Offsets.topLeftBottomOffset10).isActive = true
        searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Sizes.searchButtonMultiplierWidthSize).isActive = true
        searchButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: Sizes.searchButtonMultiplierHeightSize).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: Offsets.topLeftBottomOffset10).isActive = true
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
                
                guard let responseCard = response.value else {
                    self.networkAlert.title = response.error?.errorDescription
                    self.present(self.networkAlert, animated: true)
                    return
                }
                self.items = responseCard.cards
                self.cards = responseCard.cards
                                
                self.tableView.reloadData()
            }
    }
    
    //MARK: - UITableView methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = items[indexPath.row]
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
        selectedItem = items[indexPath.row]
        let detailViewController = DetailCardController(data: selectedItem)
        present(detailViewController, animated: true)
    }
    
    //MARK: - Actions
    
    @objc private func searchButtonTapped() {
        guard !(searchBar.text?.isEmpty ?? false) else {
            present(emptySearchAlert, animated: true)
            return
        }
        
        searchCards(with: searchBar.text ?? "")
        searchBar.resignFirstResponder()
    }
    
    //MARK: - Functions
    
    private func searchCards(with name: String) {
        let url = Strings.mtgCardsPath
        let parameters = [Strings.parameterName: name]
        
        AF.request(url, parameters: parameters)
            .validate()
            .responseDecodable(of: Cards.self) { (response) in
                guard let responseCard = response.value else { return }
                
                self.items = responseCard.cards
                
                if self.items.isEmpty {
                    self.present(self.cardNotFoundAlert, animated: true)
                }
                self.tableView.reloadData()
            }
    }
}

//MARK: - UISearchBarDelegate methods

extension CardController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        items = cards
        tableView.reloadData()
    }
}
