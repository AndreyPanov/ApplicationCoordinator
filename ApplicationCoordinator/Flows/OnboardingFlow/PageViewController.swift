class PageController: UIViewController {
  
  var pageViewController: UIPageViewController!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    pageViewController.delegate = self
    addChildViewController(pageViewController)
    view.addSubview(pageViewController.view)
  }
}

extension PageController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
  
  func pageViewController(_ pageViewController: UIPageViewController,
                          viewControllerBefore viewController: UIViewController) -> UIViewController? {
    return UIViewController()
  }
  
  func pageViewController(_ pageViewController: UIPageViewController,
                                 viewControllerAfter viewController: UIViewController) -> UIViewController? {
    return UIViewController()
  }
  
  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    return 3
  }
  
  func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    return 2
  }
}
