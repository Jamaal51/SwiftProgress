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
    
//    dispatch_async(GlobalUserInitiatedQueue){ //1  use dispatch_async to place the entire method into a background queue to ensure you don’t block the main thread.
//    var storedError: NSError?
//    var downloadGroup = dispatch_group_create() //2 This creates a new dispatch group which behaves somewhat like a counter of the number of uncompleted tasks
//    
//    for address in [OverlyAttachedGirlfriendURLString,
//                    SuccessKidURLString,
//                    LotsOfFacesURLString] {
//      let url = NSURL(string: address)
//      dispatch_group_enter(downloadGroup) //3 dispatch_group_enter manually notifies a group that a task has started. You must balance out the number of dispatch_group_enter calls with the number of dispatch_group_leave calls or else your app will crash.
//                      
//      let photo = DownloadPhoto(url: url!) {
//        image, error in
//        if error != nil {
//          storedError = error
//        }
//        dispatch_group_leave(downloadGroup) //4 Here you manually notify the group that this work is done. Again, you’re balancing all group enters with an equal amount of group leaves
//      }
//      PhotoManager.sharedManager.addPhoto(photo)
//    }
//      
//      dispatch_group_wait(downloadGroup, DISPATCH_TIME_FOREVER) //5 dispatch_group_wait waits until either all of the tasks are complete or until the time expires. If the time expires before all events complete, the function will return a non-zero result. 
//      
//      dispatch_async(GlobalMainQueue){ //6 You then make a call back to the main queue to run your completion closure
//    if let completion = completion { //7 run completion closure
//      completion(error: storedError)
//      }
//    }
//  }
    
    // 1 you don’t need to surround the method in a dispatch_async call since you’re not blocking the main thread
    
    var storedError: NSError!
    var downloadGroup = dispatch_group_create()
    
    let addresses = [OverlyAttachedGirlfriendURLString,
      SuccessKidURLString,
      LotsOfFacesURLString]
    
    dispatch_apply(addresses.count, GlobalUserInitiatedQueue){
      i in
      let index = Int(i)
      let address = addresses[index]
      let url = NSURL(string: address)
      dispatch_group_enter(downloadGroup)
      let photo = DownloadPhoto(url: url!) {
        image, error in
        if let error = error {
          storedError = error
        }
        dispatch_group_leave(downloadGroup)
      }
      PhotoManager.sharedManager.addPhoto(photo)
    }
    
    dispatch_group_notify(downloadGroup, GlobalMainQueue) { // 2 serves as the asynchronous completion closure. This code executes when there are no more items left in the dispatch group and it’s the completion closure’s turn to run. You also specify on which queue to run your completion code. Here, the main queue is the one you want
      
      if let completion = completion {
        completion(error: storedError)
      }
    }
  }
  private func postContentAddedNotification() {
    NSNotificationCenter.defaultCenter().postNotificationName(PhotoManagerAddedContentNotification, object: nil)
  }
}
