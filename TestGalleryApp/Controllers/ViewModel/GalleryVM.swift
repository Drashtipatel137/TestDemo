//
//  GalleryVM.swift
//  TestGalleryApp
//
//  Created by 2021M05 on 27/03/24.
//

import UIKit
import SwiftyJSON

class GalleryVM {

    var arrImagesDataUrls : [JSON] = [
        ["image" : "https://hips.hearstapps.com/hmg-prod/images/close-up-of-tulips-blooming-in-field-royalty-free-image-1584131603.jpg"],
        ["image" : "https://cdn.britannica.com/84/73184-050-05ED59CB/Sunflower-field-Fargo-North-Dakota.jpg"],
        ["image" : "https://img.freepik.com/free-photo/natures-beauty-captured-colorful-flower-close-up-generative-ai_188544-8593.jpg"],
        ["image" : "https://img.freepik.com/free-photo/vibrant-colors-nature-close-up-wet-purple-daisy-generated-by-artificial-intellingence_25030-63819.jpg"],
        ["image" : "https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg?cs=srgb&dl=pexels-pixabay-56866.jpg"],
        ["image" : "https://i0.wp.com/www.southsideblooms.com/wp-content/uploads/2021/12/pexels-lisa-2106037-scaled.jpg?fit=1708%2C2560&ssl=1"],
        ["image" : "https://i.pinimg.com/236x/6f/44/25/6f4425989621893d05a4d2fae632e8d5.jpg"],
        ["image" : "https://images.pexels.com/photos/931177/pexels-photo-931177.jpeg"],
        ["image" : "https://42ee06f9.flyingcdn.com/wp-content/uploads/2021/03/Mogra-Beli-Flower-Jasminum-Sambac-3x4-Product-Peppyflora-01-a-Moz.jpg"],
        ["image" : "https://hips.hearstapps.com/hmg-prod/images/close-up-of-tulips-blooming-in-field-royalty-free-image-1584131603.jpg"],
        ["image" : "https://cdn.britannica.com/84/73184-050-05ED59CB/Sunflower-field-Fargo-North-Dakota.jpg"],
        ["image" : "https://img.freepik.com/free-photo/natures-beauty-captured-colorful-flower-close-up-generative-ai_188544-8593.jpg"],
        ["image" : "https://img.freepik.com/free-photo/vibrant-colors-nature-close-up-wet-purple-daisy-generated-by-artificial-intellingence_25030-63819.jpg"],
        ["image" : "https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg?cs=srgb&dl=pexels-pixabay-56866.jpg"],
        ["image" : "https://i0.wp.com/www.southsideblooms.com/wp-content/uploads/2021/12/pexels-lisa-2106037-scaled.jpg?fit=1708%2C2560&ssl=1"],
        ["image" : "https://i.pinimg.com/236x/6f/44/25/6f4425989621893d05a4d2fae632e8d5.jpg"],
        ["image" : "https://images.pexels.com/photos/931177/pexels-photo-931177.jpeg"],
        ["image" : "https://42ee06f9.flyingcdn.com/wp-content/uploads/2021/03/Mogra-Beli-Flower-Jasminum-Sambac-3x4-Product-Peppyflora-01-a-Moz.jpg"],
        ["image" : "https://hips.hearstapps.com/hmg-prod/images/close-up-of-tulips-blooming-in-field-royalty-free-image-1584131603.jpg"],
        ["image" : "https://cdn.britannica.com/84/73184-050-05ED59CB/Sunflower-field-Fargo-North-Dakota.jpg"],
        ["image" : "https://img.freepik.com/free-photo/natures-beauty-captured-colorful-flower-close-up-generative-ai_188544-8593.jpg"],
        ["image" : "https://img.freepik.com/free-photo/vibrant-colors-nature-close-up-wet-purple-daisy-generated-by-artificial-intellingence_25030-63819.jpg"],
        ["image" : "https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg?cs=srgb&dl=pexels-pixabay-56866.jpg"],
        ["image" : "https://i0.wp.com/www.southsideblooms.com/wp-content/uploads/2021/12/pexels-lisa-2106037-scaled.jpg?fit=1708%2C2560&ssl=1"],
        ["image" : "https://i.pinimg.com/236x/6f/44/25/6f4425989621893d05a4d2fae632e8d5.jpg"],
        ["image" : "https://images.pexels.com/photos/931177/pexels-photo-931177.jpeg"],
        ["image" : "https://42ee06f9.flyingcdn.com/wp-content/uploads/2021/03/Mogra-Beli-Flower-Jasminum-Sambac-3x4-Product-Peppyflora-01-a-Moz.jpg"],
        ["image" : "https://hips.hearstapps.com/hmg-prod/images/close-up-of-tulips-blooming-in-field-royalty-free-image-1584131603.jpg"],
        ["image" : "https://cdn.britannica.com/84/73184-050-05ED59CB/Sunflower-field-Fargo-North-Dakota.jpg"],
        ["image" : "https://img.freepik.com/free-photo/natures-beauty-captured-colorful-flower-close-up-generative-ai_188544-8593.jpg"],
        ["image" : "https://img.freepik.com/free-photo/vibrant-colors-nature-close-up-wet-purple-daisy-generated-by-artificial-intellingence_25030-63819.jpg"],
        ["image" : "https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg?cs=srgb&dl=pexels-pixabay-56866.jpg"],
        ["image" : "https://i0.wp.com/www.southsideblooms.com/wp-content/uploads/2021/12/pexels-lisa-2106037-scaled.jpg?fit=1708%2C2560&ssl=1"],
        ["image" : "https://i.pinimg.com/236x/6f/44/25/6f4425989621893d05a4d2fae632e8d5.jpg"],
        ["image" : "https://images.pexels.com/photos/931177/pexels-photo-931177.jpeg"],
        ["image" : "https://42ee06f9.flyingcdn.com/wp-content/uploads/2021/03/Mogra-Beli-Flower-Jasminum-Sambac-3x4-Product-Peppyflora-01-a-Moz.jpg"]
    
    ]
 
}
extension GalleryVM {
    
    func numberOfListRow() -> Int {
        self.arrImagesDataUrls.count
    }
    
    func listRow(for index: Int) -> JSON {
        self.arrImagesDataUrls[index]
    }
    
}
   
