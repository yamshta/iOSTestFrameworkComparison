
import UIKit

protocol DramaListViewControllerOutput: class {
    func setDramaListState(_: DramaListState)
}

class DramaListViewController: UIViewController {

    let dramaListTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 100
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.allowsSelection = false
        tableView.register(DramaTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(DramaTableViewCell.self))
        tableView.accessibilityIdentifier = "dramaListTableView"
        return tableView
    }()

    let blankLabel: UILabel = {
        let label = UILabel()
        label.text = "データがありません😩"
        label.textAlignment = .center
        label.accessibilityIdentifier = "blankLabel"
        return label
    }()

    let loadActivityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.activityIndicatorViewStyle = .whiteLarge
        activityIndicatorView.color = UIColor.darkGray
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.accessibilityIdentifier = "loadActivityIndicatorView"
        return activityIndicatorView
    }()

    fileprivate var presenter: DramaListPresenter!

    func inject(presenter: DramaListPresenter) {
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.fetchDramaList()
    }
}

// MARK: Private and Set Condition
extension DramaListViewController {
    fileprivate func setupUI() {
        view.backgroundColor = UIColor.white

        view.addSubview(blankLabel)
        blankLabel.translatesAutoresizingMaskIntoConstraints = false
        blankLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blankLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        dramaListTableView.dataSource = self
        dramaListTableView.delegate = self
        view.addSubview(dramaListTableView)
        dramaListTableView.translatesAutoresizingMaskIntoConstraints = false
        dramaListTableView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        dramaListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        dramaListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        dramaListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        view.addSubview(loadActivityIndicatorView)
        loadActivityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        loadActivityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadActivityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    @objc fileprivate func changeValueSlider(_ sender: UISlider) {
        sender.value = round(sender.value)
        sender.setThumbImageValue()
    }
}

// MARK: DramaListViewControllerOutput
extension DramaListViewController: DramaListViewControllerOutput {
    func setDramaListState(_ state: DramaListState) {
        switch state {
        case .blank:
            loadActivityIndicatorView.stopAnimating()
            blankLabel.isHidden = false
            dramaListTableView.isHidden = true
        case .loading:
            loadActivityIndicatorView.startAnimating()
        case .working:
            loadActivityIndicatorView.stopAnimating()
            blankLabel.isHidden = true
            dramaListTableView.isHidden = false
            dramaListTableView.reloadData()
        case .error:
            print("error")
        }
    }
}

extension DramaListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.dramaList.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(DramaTableViewCell.self), for: indexPath) as? DramaTableViewCell else {
            fatalError("DramaTableViewCell is not found")
        }
        cell.setData(presenter.dramaList.items[indexPath.row])
        // 簡易的にViewController側で設定しているが、DramaTableViewCellにdelegateを持たせるなどの方がいい
        cell.seasonSlider.addTarget(self, action: #selector(DramaListViewController.changeValueSlider(_:)), for: [.valueChanged, .touchUpInside])
        return cell
    }
}

extension DramaListViewController: UITableViewDelegate {}
