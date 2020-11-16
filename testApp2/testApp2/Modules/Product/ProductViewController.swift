import UIKit

class ProductViewController: UIViewController {

    // MARK: - UI Properties.
    
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties.

    private var products = [Response.Datum]()

    // MARK: - Lifecycle.

    override func viewDidLoad() {
        super.viewDidLoad()
        initTable()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        ProductManager().fetch { [weak self] (products) in
            guard let products = products else { return }
            self?.products = products.data
            self?.tableView.reloadData()
        }
    }

    //MARK: - Private Methods

    private func initTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: ProductTableViewCell.reuseID, bundle: nil), forCellReuseIdentifier: ProductTableViewCell.reuseID)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
    }

}


extension ProductViewController: UITableViewDelegate {

}

extension ProductViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.reuseID, for: indexPath) as! ProductTableViewCell
        cell.configuration(product: products[indexPath.row])
        return cell
    }
}
