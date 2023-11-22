import UIKit

class ViewController: UIViewController {
    let scrollView = UIScrollView()
    let initialHeight = 44.0

    override func viewDidLoad() {
        super.viewDidLoad()

        setupScrollView()
        setupLogoAtTitleView()
    }

    func setupLogoAtTitleView() {
        let pv = getAvatarView()
        self.navigationItem.title = "Avatar"
    }

    func getAvatarView() -> UIView {
        let logo = UIImage(systemName: "person.crop.circle.fill")?.withTintColor(.gray)
        let imgV = UIImageView(image:logo)
        imgV.tintColor = .gray
        imgV.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        let label = UILabel()
        label.text = "Avatar"
        label.frame = CGRect(x: 70, y: 0, width: 100, height: 44)
        let avatarView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: initialHeight))
        avatarView.addSubview(imgV)
        avatarView.addSubview(label)
        return avatarView
    }

    func setupScrollView() {
        let contentRect = CGRect(
            origin: .zero,
            size: CGSize(
                width: UIScreen.main.bounds.width,
                height: 2 * UIScreen.main.bounds.height
            )
        )

        let contentView = UIView(frame: contentRect)
        scrollView.addSubview(contentView)

        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 2 * view.bounds.height)
        scrollView.delegate = self
        scrollView.frame = CGRect(x: 0, y: 2*initialHeight, width: view.bounds.width, height: view.bounds.height)
        scrollView.addSubview(getAvatarView())
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("scrollView.contentOffset.y", scrollView.contentOffset.y)
        let hide = scrollView.contentOffset.y < initialHeight
        self.navigationController?.setNavigationBarHidden(hide, animated: true)
    }
}
