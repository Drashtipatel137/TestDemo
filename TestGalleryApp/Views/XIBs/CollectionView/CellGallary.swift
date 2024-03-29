//
//  CellGallary.swift
//  TestGalleryApp
//
//  Created by 2021M05 on 27/03/24.
//

import UIKit
import SwiftyJSON
import FMDB

class CellGallary: UICollectionViewCell {
    
    
    //MARK: - Outlet -
    @IBOutlet weak var imgGallery: CustomImageView!
    //----------------------------------------------------------------------//
    
    //MARK: - Custom Variables -
    
    var arrImages = [UIImage]()
    //----------------------------------------------------------------------//
    
    //MARK: - Custom Methods -
    
    func setUp() {
        self.applyTheme()
    }
    
    
    func applyTheme() {
        self.imgGallery.layer.cornerRadius  = 20
        self.imgGallery.backgroundColor = .cyan
    }
    
    func storeImageInDatabase(_ images: [UIImage]) {
        let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! + "/images.sqlite"
           let database = FMDatabase(path: dbPath)

           if database.open() {
               do {
                   try database.executeUpdate("CREATE TABLE IF NOT EXISTS images (id INTEGER PRIMARY KEY AUTOINCREMENT, imageData BLOB)", values: nil)

                   // Begin a transaction
                   try database.beginTransaction()

                   // Loop through each image and insert into the database
                   for image in images {
                       guard let data = image.pngData() else { continue }
                       try database.executeUpdate("INSERT INTO images (imageData) VALUES (?)", values: [data])
                   }

                   // Commit the transaction
                   database.commit()

                   print("Images inserted successfully.")
               } catch {
                   print("Error inserting images: \(error.localizedDescription)")

                   // Rollback the transaction in case of an error
                   database.rollback()
               }
               database.close()
           }
        }

        func retrieveImageFromDatabase() -> [UIImage] {
            // Path to the SQLite database file
            let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! + "/images.sqlite"
            let database = FMDatabase(path: dbPath)
//            var image: UIImage?
            var images: [UIImage] = []
            if database.open() {
                do {
                    let resultSet = try database.executeQuery("SELECT * FROM images", values: nil)
                    if resultSet.next() {
                        if let imageData = resultSet.data(forColumn: "imageData"),
                           let image = UIImage(data: imageData) {
                            images.append(image)
                        }
                    }
                } catch {
                    print("Error retrieving image: \(error.localizedDescription)")
                }
                database.close()
            }
            return images
        }
    
    func configData(_ data : JSON) {
        
          self.imgGallery.loadImages(url: URL(string: data["image"].stringValue)!)
//        let url = URL(string:data["image"].stringValue)
//            if let data = try? Data(contentsOf: url!)
//            {
//              let image: UIImage = UIImage(data: data)!
//                self.imgGallery.image = image
//            }

//        let images = retrieveImageFromDatabase()
//                if images.isEmpty {
//                    // If no images found in the database, download and store from URL
//                    if let url = URL(string: data["image"].stringValue),
//                       let imageData = try? Data(contentsOf: url),
//                       let image = UIImage(data: imageData) {
//                        self.imgGallery.image = image
//                        // Store the image in the database
////                        storeImageInDatabase([image])
//                        arrImages.append(image)
//                    }
//                } else {
//                    // If images found in the database, display them
//                    let imageIndex = tag % images.count // Assuming you have a unique tag for each cell
//                    self.imgGallery.image = images[imageIndex]
//
//                }
    }
    //----------------------------------------------------------------------//
    
    //MARK: - Actions -
    
    
    //----------------------------------------------------------------------//
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUp()
    }
    
}
//----------------------------------------------------------------------//
