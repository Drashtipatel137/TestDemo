//
//  GalleryVC.swift
//  TestGalleryApp
//
//  Created by 2021M05 on 27/03/24.
//

import UIKit
import GoogleSignIn

class GalleryVC: UIViewController {
    
    //MARK: - Outlet

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var colGallery: UICollectionView!
    @IBOutlet weak var btnLogOut: UIBarButtonItem!
    //------------------------------------------------------
    
    //MARK: - Class Variable
    var viewModel = GalleryVM()
//    var name = ""
    //------------------------------------------------------
    
    //MARK: - Memory Management Method
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    deinit {
        debugPrint("‼️‼️‼️ deinit : \(self.classForCoder) ‼️‼️‼️")
    }
    
    //------------------------------------------------------
    
    //MARK: - Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    //------------------------------------------------------
    
    //MARK: - Custom Method
    
    private func setUpView() {
        self.applyStyle()
        self.colGallery.delegate = self
        self.colGallery.dataSource = self
        let nib = UINib(nibName: "CellGallary", bundle: nil)
        self.colGallery.register(nib, forCellWithReuseIdentifier: "CellGallary")
    }
    
    private func applyStyle(){
        if let name = UserDefaults.standard.value(forKey: "name") as? String {
        self.lblName?.text = "Hello👋 !! \(name)"
        self.lblName.textColor = .white
    } else {
        self.lblName.text = ""
        let alert = UIAlertController(title:"Error", message: "Your session is expire please login", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            UserDefaultsConfig.isLogin = false
            UIApplication.shared.manageLogin()
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
        
    }

    /**
     Setup all view model observer and handel data and erros.
     */
    private func setupViewModelObserver() {
        // Result binding observer
    
        /*self.viewModel.loginResult.bind(observer: { [unowned self] (result) in
         switch result {
         case .success(_):
            // Redirect to next screen or home screen
            //                UIApplication.shared.setHome()
            break
            
        case .failure(let error):
            Alert.shared.showSnackBar(error.errorDescription ?? "", isError: true)
            
        case .none: break
        }
         })*/
    }
    
    //------------------------------------------------------
    
    //MARK: - Action Method
    
    
    @IBAction func btnLogOutTapped(_ sender: Any) {
        
        GIDSignIn.sharedInstance.signOut()
        UserDefaultsConfig.isLogin = true
        UserDefaults.standard.setValue(nil, forKey: "name")
        UIApplication.shared.manageLogin()
    }
    //------------------------------------------------------
    
}
extension GalleryVC : UICollectionViewDelegate , UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel.numberOfListRow()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellGallary", for: indexPath) as! CellGallary
        cell.configData(viewModel.listRow(for: indexPath.row))
//        if indexPath.row == viewModel.numberOfListRow() - 1 {
//            cell.storeImageInDatabase(cell.arrImages)
//        }
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: (self.colGallery.frame.width - 10) / 3, height: (self.colGallery.frame.width - 10)/3)
        
        let padding: CGFloat = 10 // Adjust padding as needed
            let collectionViewWidth = collectionView.frame.width
            let itemWidth = (collectionViewWidth - 2 * padding) / 3 // Divide by the number of items per row

            return CGSize(width: itemWidth, height: itemWidth) // Assuming square cells, adjust height as needed
        }
    
//
}
//----------------------------------------------------------------------//
