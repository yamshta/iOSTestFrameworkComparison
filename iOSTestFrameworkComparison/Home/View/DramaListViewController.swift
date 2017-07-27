
import UIKit

protocol DramaViewControllerOutput: class {
    func setdramasModel(_: DramasModel)
}

class DramaViewController: UIViewController {

    var tableView = UITableView()

    fileprivate var presenter: DramaPresenter!

    func inject(presenter: DramaPresenter) {
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: Private and Set Condition
extension DramaViewController {
    fileprivate func setupUI() {
        view.backgroundColor = UIColor.white

        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: DramaViewControllerOutput
extension DramaViewController: DramaViewControllerOutput {
    func setdramasModel(_ model: DramasModel) {

    }
}

extension DramaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: <#T##String#>, for: <#T##IndexPath#>)
    }
}

extension DramaViewController: UITableViewDelegate {}
