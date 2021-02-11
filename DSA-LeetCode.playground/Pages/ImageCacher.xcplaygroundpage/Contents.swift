//: [Previous](@previous)

import Foundation

// Q1: image cacher

// Create an image cache object in Swift, that uses the URLFetcher protocol (provided) to retrieve images efficiently given a URL


class Image {
    init?(data: Data) {
        //
    }
}

protocol URLFetcher {
    
    func fetchDataFromURL(_ url: URL, completion: @escaping (Result<Data, Error>) -> Void)
    
    
}

class ImageCacher {
    
    private var cachedImages: [URL: Image]
    
    
    
    func fetchImage(url: URL, completion: @escaping (Result<Image, Error>) -> Void) {
        /*
         url -> data -> Image
         */
        if let image = chachedImages[url] {
            completion(.success(image))
            return
        }
        
        URLFetcher.shared.fetchDataFromURL(url) { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                if let image = Image(data: data) {
                    cachedImages[url] = image
                    completion(.success(image))
                }else {
                    completion(.failure(imageDataError))
                }
            }
            
        }
        
    }
}




// @protocol ImageFetcher <NSObject>

// // Performs a GET request
// - (void)fetchImageAtURL:(NSURL *)URL
//             completion:(void (^)(Image * _Nullable responseImage,
//                                  NSError * _Nullable error))completion;

// @end
