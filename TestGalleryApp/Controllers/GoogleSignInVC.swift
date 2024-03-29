//
//  GoogleSignInVC.swift
//  TestGalleryApp
//
//  Created by 2021M05 on 27/03/24.
//

import UIKit
import GoogleSignIn

class GoogleSignInVC: UIViewController {
    
    //MARK: - Outlet

    
    @IBOutlet weak var btnGoogleSignIn: UIButton!
    //------------------------------------------------------
    
    //MARK: - Class Variable
//    private var viewModel : AuthViewModel = AuthViewModel()
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
        self.setupViewModelObserver()
    }

    private func applyStyle(){
        
        self.btnGoogleSignIn.layer.cornerRadius = 10
        if GIDSignIn.sharedInstance.hasPreviousSignIn() {
            GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                if let error = error {
                    // Handle the error
                    print("Error restoring previous sign-in: \(error.localizedDescription)")
                } else if user != nil {
                    // User restored successfully
                    print("User restored: \(user.debugDescription)")
                } else {
                    // No previous sign-in found
                    print("No previous sign-in found.")
                }
            }
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
    
    @IBAction func btnGoogleSignInTapped(_ sender: Any) {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
                   
//                self.btnGoogleSignIn.isHidden = false
            guard error == nil else { return }
            // If sign in succeeded, display the app's main content View.
            guard let signInResult = signInResult else { return }
            let user = signInResult.user
            print(user)
            let emailAddress = user.profile?.email
            print(emailAddress)
            let familyName = user.profile?.familyName
            print(familyName)
            let fullName = user.profile?.name
            UserDefaults.standard.setValue(fullName, forKey: "name")
//            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "GalleryVC") as? GalleryVC
//            vc?.name = fullName ?? ""
            UserDefaultsConfig.isLogin = true
            print(signInResult.user.profile?.name)
           
            self.btnGoogleSignIn.isHidden = true
//          self.btnGoogleSignOut.isHidden = false
            
            UIApplication.shared.manageLogin()
//            self.navigationController?.pushViewController(vc!, animated: true)
    
        }
        
        
    }
    
    //------------------------------------------------------
    
}
