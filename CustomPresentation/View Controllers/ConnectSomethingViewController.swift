import UIKit

class ConnectSomethingViewController: UIViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        transitioningDelegate = self
        modalPresentationStyle = .custom
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let titleLabel = UILabel()
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.text = "Connect Something?"

        let messageLabel = UILabel()
        messageLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
        messageLabel.font = .systemFont(ofSize: 20, weight: .medium)
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.text = "Connect your thing by tapping this button. Then we’ll get started!"

        let connectButton = UIButton(type: .system)
        connectButton.titleLabel?.font = .systemFont(ofSize: 24, weight: .medium)
        connectButton.setTitle("Connect", for: .normal)
        connectButton.addTarget(self, action: #selector(presentConnection), for: .primaryActionTriggered)

        let cancelButton = UIButton(type: .system)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.addTarget(self, action: #selector(close), for: .primaryActionTriggered)

        let stackView = UIStackView(arrangedSubviews: [titleLabel, messageLabel, connectButton, cancelButton])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 4

        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
        ])
    }

    @objc private func presentConnection() {
        let closeButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(close))
        let viewController = UIViewController()
        viewController.view.backgroundColor = .white
        viewController.view.alpha = 0.7
        viewController.navigationItem.rightBarButtonItem = closeButton
        let navigationController = UINavigationController(rootViewController: viewController)
        present(navigationController, animated: true)
    }

    @objc private func close() {
        dismiss(animated: true)
    }
}

extension ConnectSomethingViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CardPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
