import UIKit

class ProductTableViewCell: UITableViewCell {

    // MARK: - UI Properties.

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    // MARK: - Properties.

    static let reuseID = String(describing: ProductTableViewCell.self)

    // MARK: - Initialization.

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        subtitleLabel.text = nil
        priceLabel.text = nil
    }

    // MARK: - Configuration.

    func configuration(product: Response.Datum) {
        titleLabel.text = product.name
        subtitleLabel.text = product.datumDescription
        priceLabel.text = product.price
    }
}
