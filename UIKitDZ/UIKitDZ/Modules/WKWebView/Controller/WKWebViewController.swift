// WKWebViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

/// Экран для показа webView
final class WKWebViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        enum Insets {
            static let toolBarHeight: CGFloat = 55
            static let shortSpacerWidth: CGFloat = 30
        }

        enum Texts {
            static let url = "https://www.google.com"
        }
    }

    // MARK: - Visual Components

    private let webView = WKWebView()
    private let toolBar = UIToolbar()

    private let shortSpacer = UIBarButtonItem(
        barButtonSystemItem: .fixedSpace, target: nil, action: nil
    )
    private let flexibleSpacer = UIBarButtonItem(
        barButtonSystemItem: .flexibleSpace, target: nil, action: nil
    )

    private let backButtonItem = UIBarButtonItem(
        image: .backButton,
        style: .plain,
        target: nil,
        action: #selector(backAction)
    )

    private let forwardButtonItem = UIBarButtonItem(
        image: .forwardButton,
        style: .plain,
        target: nil,
        action: #selector(forwardAction)
    )
    private let refreshButtonItem = UIBarButtonItem(
        image: .refreshButton,
        style: .plain,
        target: nil,
        action: #selector(refreshAction)
    )

    // MARK: - Live Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        configureSubviews()
        setupToolbar()
        configureToolbarButtons()
        loadRequest()
    }

    // MARK: - Private Methods

    private func setupSubviews() {
        view.addSubviews([
            webView,
            toolBar
        ])
        view.backgroundColor = .white
    }

    private func configureSubviews() {
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            toolBar.topAnchor.constraint(equalTo: webView.bottomAnchor),
            toolBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toolBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toolBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            toolBar.heightAnchor.constraint(
                equalToConstant: Constants.Insets.toolBarHeight
            ),

        ])
    }

    private func setupToolbar() {
        toolBar.items = [
            shortSpacer,
            backButtonItem,
            shortSpacer,
            forwardButtonItem,
            flexibleSpacer,
            refreshButtonItem,
            shortSpacer
        ]
    }

    private func configureToolbarButtons() {
        backButtonItem.tintColor = .black
        forwardButtonItem.tintColor = .black
        refreshButtonItem.tintColor = .black
        shortSpacer.width = Constants.Insets.shortSpacerWidth
    }

    private func loadRequest() {
        guard let url = URL(string: Constants.Texts.url)
        else { return }

        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }

    @objc private func backAction() {
        guard webView.canGoBack else { return }
        webView.goBack()
    }

    @objc private func forwardAction() {
        guard webView.canGoForward else { return }
        webView.goForward()
    }

    @objc private func refreshAction() {
        webView.reload()
    }
}
