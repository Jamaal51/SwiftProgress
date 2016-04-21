//
//  PhotoManager.swift
//  GooglyPuff
//
//  Created by Bjørn Olav Ruud on 06.08.14.
//  Copyright (c) 2014 raywenderlich.com. All rights reserved.
//

import Foundation

/// Notification when new photo instances are added
let PhotoManagerAddedContentNotification = "com.raywenderlich.GooglyPuff.PhotoManagerAddedContent"
/// Notification when content updates (i.e. Download finishes)
let PhotoManagerContentUpdateNotification = "com.raywenderlich.GooglyPuff.PhotoManagerContentUpdate"

typealias PhotoProcessingProgressClosure = (completionPercentage: CGFloat) -> Void
typealias BatchPhotoDownloadingCompletionClosure = (error: NSError?) -> Void

private let _sharedManager = PhotoManager()

class PhotoManager {
  class var sharedManager: PhotoManager {
    return _sharedManager
  }

  private var _photos: [Photo] = []
  
  var photos: [Photo] {
    var photosCopy: [Photo]!
    dispatch_sync(concurrentPhotoQueue){ //1 Dispatch synchronously onto the concurrentPhotoQueue to perform the read
      photosCopy = self._photos //2 Store a copy of the photo array in photosCopy and return it.
    }
    return photosCopy
  }
  
  private let concurrentPhotoQueue = dispatch_queue_create("com.raywenderlich.GooglyPuff.photoQueue", DISPATCH_QUEUE_CONCURRENT) //This initializes concurrentPhotoQueue as a concurrent queue using dispatch_queue_create. The first parameter is a reversed DNS style naming convention; the second parameter specifies whether you want your queue to be serial or concurrent

  func addPhoto(photo: Photo) {
    dispatch_barrier_async(concurrentPhotoQueue){ //1 Add the write operation using your custom queue. When the critical section executes at a later time this will be the only item in your queue to execute.
      
      self._photos.append(photo) //2 Since it’s a barrier closure, this closure will never run simultaneously with any other closure in concurrentPhotoQueue.

      dispatch_async(GlobalMainQueue) { //3 post a notification that you’ve added the image. This notification should be posted from the main thread because it will do UI work, so here you dispatch another task asynchronously to the main queue for the notification.
        self.postContentAddedNotification()
    }
  }
}

  func downloadPhotosWithCompletion(completion: BatchPhotoDownloadingCompletionClosure?) {
    var storedError: NSError?
    for address in [OverlyAttachedGirlfriendURLString,
                    SuccessKidURLString,
                    LotsOfFacesURLString] {
      let url = NSURL(string: address)
      let photo = DownloadPhoto(url: url!) {
        image, error in
        if error != nil {
          storedError = error
        }
      }
      PhotoManager.sharedManager.addPhoto(photo)
    }

    if let completion = completion {
      completion(error: storedError)
    }
  }

  private func postContentAddedNotification() {
    NSNotificationCenter.defaultCenter().postNotificationName(PhotoManagerAddedContentNotification, object: nil)
  }
}
