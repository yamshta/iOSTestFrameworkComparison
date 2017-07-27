
import UIKit

protocol DramaListViewControllerOutput: class {
    func setDramaModels(_: DramaModels)
}

class DramaListViewController: UIViewController {

    fileprivate var tableView = UITableView()

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

        view.addSubview(tableView)
        tableView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.allowsSelection = false
        tableView.register(DramaTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(DramaTableViewCell.self))
    }
}

// MARK: DramaListViewControllerOutput
extension DramaListViewController: DramaListViewControllerOutput {
    func setDramaModels(_ models: DramaModels) {
        dramas = models.items
        tableView.reloadData()
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
