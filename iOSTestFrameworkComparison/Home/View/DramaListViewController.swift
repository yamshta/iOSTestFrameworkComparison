
import UIKit

protocol DramaListViewControllerOutput: class {
    func setDramaListState(_: DramaListState)
}

class DramaListViewController: UIViewController {

    fileprivate let tableView = UITableView()
    fileprivate let blankLabel = UILabel()
    fileprivate let activityIndicatorView = UIActivityIndicatorView()

    fileprivate var dramas = [DramaModel]()

    fileprivate var presenter: DramaListPresenter!

    func inject(presenter: DramaListPresenter) {
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.fetch()
    }
}

// MARK: Private and Set Condition
extension DramaListViewController {
    fileprivate func setupUI() {
        view.backgroundColor = UIColor.white

        blankLabel.text = "データがありません😩"
        blankLabel.textAlignment = .center
        view.addSubview(blankLabel)
        blankLabel.translatesAutoresizingMaskIntoConstraints = false
        blankLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blankLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.allowsSelection = false
        tableView.register(DramaTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(DramaTableViewCell.self))
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        activityIndicatorView.activityIndicatorViewStyle = .whiteLarge
        activityIndicatorView.color = UIColor.darkGray
        activityIndicatorView.hidesWhenStopped = true
        view.addSubview(activityIndicatorView)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

// MARK: DramaListViewControllerOutput
extension DramaListViewController: DramaListViewControllerOutput {
    func setDramaListState(_ state: DramaListState) {
        switch state {
        case .blank:
            activityIndicatorView.stopAnimating()
            blankLabel.isHidden = false
            tableView.isHidden = true
        case .loading:
            activityIndicatorView.startAnimating()
        case .working(let models):
            activityIndicatorView.stopAnimating()
            blankLabel.isHidden = true
            tableView.isHidden = false
            dramas += models.items
            tableView.reloadData()
        case .error(let error):
            print(error)
        }
    }
}

extension DramaListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dramas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(DramaTableViewCell.self), for: indexPath) as? DramaTableViewCell else {
            fatalError("DramaTableViewCell is not found")
        }
        cell.setData(dramas[indexPath.row])
        cell.layoutIfNeeded()
        return cell
    }
}

extension DramaListViewController: UITableViewDelegate {}
