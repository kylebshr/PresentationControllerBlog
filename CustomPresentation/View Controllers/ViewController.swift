import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let shortToastButton = UIButton(type: .system)
        shortToastButton.setTitle("Short Toast", for: .normal)
        shortToastButton.addTarget(self, action: #selector(presentShortToast), for: .primaryActionTriggered)

        let longToastButton = UIButton(type: .system)
        longToastButton.setTitle("Long Toast", for: .normal)
        longToastButton.addTarget(self, action: #selector(presentLongToast), for: .primaryActionTriggered)

        let cardButton = UIButton(type: .system)
        cardButton.setTitle("Connection Card", for: .normal)
        cardButton.addTarget(self, action: #selector(presentConnectionCard), for: .primaryActionTriggered)

        let buttonStack = UIStackView(arrangedSubviews: [shortToastButton, longToastButton, cardButton])
        buttonStack.axis = .vertical
        buttonStack.spacing = 8

        view.addSubview(buttonStack)
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    @objc private func presentShortToast() {
        presentToast(title: "This is a toast!")
    }

    @objc private func presentLongToast() {
        presentToast(title: "This is also a toast! But the text is so long that the text needs to wrap. It may even need three lines!")
    }

    private func presentToast(title: String) {
        let toast = ToastViewController(title: title)
        present(toast, animated: true)
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
            toast.dismiss(animated: true)
        }
    }

    @objc private func presentConnectionCard() {
        let viewController = ConnectSomethingViewController()
        present(viewController, animated: true, completion: nil)
    }
}
