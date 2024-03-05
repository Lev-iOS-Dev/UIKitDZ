// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Интерфейс взаимодействия с View
protocol ProfileViewControllerProtocol: AnyObject {
    /// Показывает алерт с выходом из учетной записи
    func showLogoutAlert()
    /// Показывает алерт со сменой имени
    func showNameChangeAlert()
}

/// Экран прфиля
final class ProfileViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let verdanaFont = "Verdana"
        static let verdanaBoldFont = "Verdana-Bold"
        static let navigationBarTitle = "Profile"
        static let alertChangeNameTitle = "Change your name and surname"
        static let alertTextFieldPlaceholder = "Name Surname"
        static let cancelActionTitle = "Cancel"
        static let okActionTextTitle = "Ok"
        static let alertLogoutTitle = "Are you sure you want to\nlog out?"
    }

    enum CardState {
        case expanded
        case collapsed
    }

    // MARK: - Visual Components

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UserInfoTableCell.self, forCellReuseIdentifier: UserInfoTableCell.Constants.identifier)
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: OptionsTableViewCell.Constants.identifier)
        tableView.allowsSelection = true
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    // MARK: Public Properties

    var presenter: ProfilePresenterProtocol?
    var passTextToCellHandler: StringHandler?

    var cardView = CardView()
    let cardHeight: CGFloat = 800
    let cardHandleAreaHeight: CGFloat = 100

    var cardVisible = false
    var nextState: CardState {
        cardVisible ? .collapsed : .expanded
    }

    var runningAnimations: [UIViewPropertyAnimator] = []
    var animationProggresWhenInterrupted: CGFloat = 0

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
        setupNavigationBar()
        setupTableViewConstraints()
        setupCard()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupCard()
    }

    // MARK: - Private Methodes

    private func setupSubviews() {
        view.addSubviews([
            tableView
        ])
        view.insertSubview(cardView, at: view.subviews.count)
        // view.bringSubviewToFront(cardView)
    }

    private func setupNavigationBar() {
        navigationItem.title = Constants.navigationBarTitle
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.myFont(
            fontName: Constants.verdanaBoldFont,
            fontSize: 28
        )]
    }

    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func setupCard() {
        cardView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardView)
        view.bringSubviewToFront(cardView)

        cardView.frame = CGRect(
            x: 0,
            y: view.frame.height - cardHandleAreaHeight,
            width: view.bounds.width,
            height: cardHeight
        )

        cardView.clipsToBounds = true

        let tapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(handleCardTap(recognizer:))
        )

        let panGestureRecognizer = UIPanGestureRecognizer(
            target: self,
            action: #selector(handleCardPan(recognizer:))
        )

        cardView.addGestureRecognizer(
            tapGestureRecognizer
        )

        cardView.addGestureRecognizer(
            panGestureRecognizer
        )
    }
}

// MARK: - ProfileViewController + UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter?.loadProfileCellTypes().count ?? 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellType = presenter?.loadProfileCellTypes()[section]
        switch cellType {
        case .userInfo, .bonuses, .privacy, .logout:
            return 1
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let safePresenter = presenter else { return UITableViewCell() }

        let cellType = safePresenter.loadProfileCellTypes()[indexPath.section]
        switch cellType {
        case .userInfo:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: UserInfoTableCell.Constants.identifier,
                for: indexPath
            ) as? UserInfoTableCell else { return UITableViewCell() }
            cell.configureCell(info: safePresenter.loadInfo().userInfo)
            cell.showAlert = { [weak self] in
                self?.presenter?.showNameChangeAlert()
            }
            passTextToCellHandler = { text in
                cell.changeUserName(text: text)
            }
            return cell
        case .bonuses:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: OptionsTableViewCell.Constants.identifier,
                for: indexPath
            ) as? OptionsTableViewCell else { return UITableViewCell() }
            cell.configureCell(info: safePresenter.loadInfo().bonuses)
            cell.selectionStyle = .none
            cell.accessoryType = .disclosureIndicator
            return cell
        case .privacy:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: OptionsTableViewCell.Constants.identifier,
                for: indexPath
            ) as? OptionsTableViewCell else { return UITableViewCell() }
            cell.configureCell(info: safePresenter.loadInfo().privacy)
            cell.selectionStyle = .none
            cell.accessoryType = .disclosureIndicator
            return cell
        case .logout:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: OptionsTableViewCell.Constants.identifier,
                for: indexPath
            ) as? OptionsTableViewCell else { return UITableViewCell() }
            cell.configureCell(info: safePresenter.loadInfo().logout)
            cell.selectionStyle = .none
            cell.accessoryType = .disclosureIndicator
            return cell
        }
    }
}

// MARK: - ProfileViewController + UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedCell = presenter?.loadProfileCellTypes()[indexPath.section]
        switch selectedCell {
        case .userInfo:
            return
        case .bonuses:
            presenter?.pushBonusView()
        case .privacy:
            presenter?.pushTermsOfUse()
        case .logout:
            presenter?.showLogoutAlert()
        default:
            break
        }
    }
}

// MARK: - ProfileViewController + ProfileViewControllerProtocol

extension ProfileViewController: ProfileViewControllerProtocol {
    func showNameChangeAlert() {
        let alert = UIAlertController(title: Constants.alertChangeNameTitle, message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = Constants.alertTextFieldPlaceholder
            let cancelAction = UIAlertAction(title: Constants.cancelActionTitle, style: .cancel)
            let okAction = UIAlertAction(title: Constants.okActionTextTitle, style: .default) { [weak self] _ in
                let userText = alert.textFields?.first?.text
                self?.passTextToCellHandler?(userText ?? "blank")
            }
            alert.addAction(cancelAction)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }

    func showLogoutAlert() {
        let alert = UIAlertController(title: Constants.alertLogoutTitle, message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: Constants.cancelActionTitle, style: .cancel)
        let okAction = UIAlertAction(title: Constants.okActionTextTitle, style: .default) { [weak self] _ in
            self?.presenter?.logout()
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

/// расширение для добавлении логики property animator
extension ProfileViewController {
    @objc func handleCardTap(recognizer: UITapGestureRecognizer) {
        print("Tap")
    }

    @objc func handleCardPan(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            startInteractiveTransition(
                state: nextState,
                duration: 0.9
            )
        case .changed:
            updateInteractiveTransition(fractionComplited: 0)
        case .ended:
            continueInteractiveTransition()
        default:
            break
        }
    }

    func animateTransitionIfNeeded(state: CardState, duration: TimeInterval) {
        if runningAnimations.isEmpty {
            let frameAnimator = UIViewPropertyAnimator(
                duration: duration,
                dampingRatio: 1
            ) {
                switch state {
                case .expanded:
                    self.cardView.frame.origin.y = self.view.frame.height - self.cardHeight
                case .collapsed:
                    self.cardView.frame.origin.y = self.view.frame.height - self.cardHandleAreaHeight
                }
            }

            frameAnimator.addCompletion { _ in
                self.cardVisible.toggle()
                self.runningAnimations.removeAll()
            }
            frameAnimator.startAnimation()
            runningAnimations.append(frameAnimator)
        }
    }

    func startInteractiveTransition(
        state: CardState,
        duration: TimeInterval
    ) {
        if runningAnimations.isEmpty {
            animateTransitionIfNeeded(
                state: state,
                duration: duration
            )
        }
        for animator in runningAnimations {
            animator.pauseAnimation()
            animationProggresWhenInterrupted = animator.fractionComplete
        }
    }

    func updateInteractiveTransition(fractionComplited: CGFloat) {
        for animator in runningAnimations {
            animator.fractionComplete = fractionComplited + animationProggresWhenInterrupted
        }
    }

    func continueInteractiveTransition() {
        for animator in runningAnimations {
            animator.continueAnimation(
                withTimingParameters: nil,
                durationFactor: 0
            )
        }
    }
}
