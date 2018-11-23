//
//  FeedsTableViewController.swift
//  VimeoTestApp
//
//  Created by Arshad Parwez on 04/02/17.
//  Copyright © 2017 Arshd Parwez. All rights reserved.
//

import UIKit
import Foundation

class FeedsTableViewController: UITableViewController {
    
    var currentPage:Int = 0
    var maxPages:Int = 3
    
    var feedsArray = Array<Parser.AlbumVideos>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.estimatedRowHeight = 104
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        tableView.setNeedsLayout()
        tableView.layoutIfNeeded()
        tableView.contentInset = UIEdgeInsetsMake(6, 0, 2, 0)
        
        if Reachability.isConnectedToNetwork() {
            loadFeed(page: 1)
        } else {
            // Show internet connection errors
            NotificationController.showNotification(self.view, notificationText: "Internet Not Connected")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (self.currentPage == self.maxPages) {
            return feedsArray.count
        } else {
            return feedsArray.count + 1
        }
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (self.currentPage != self.maxPages && indexPath.row == self.feedsArray.count - 1 ) {
            if Reachability.isConnectedToNetwork() {
                self.loadFeed(page: self.currentPage + 1)
            } else {
                // Show internet connection errors
                NotificationController.showNotification(self.view, notificationText: "Internet Not Connected")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        
        if (indexPath.row == self.feedsArray.count && self.currentPage < self.maxPages) {
            cell = tableView.dequeueReusableCell(withIdentifier: "loadingCell", for: indexPath)
            let activityIndicator:UIActivityIndicatorView = cell.contentView.viewWithTag(100) as! UIActivityIndicatorView
            activityIndicator.startAnimating()
        } else {
            let feedCell = tableView.dequeueReusableCell(withIdentifier: "vimeoFeedCell", for: indexPath) as! FeedsCell
            
            LazyImage.show(imageView:feedCell.videoThumbnail, url:CommonFunctions.changeURLExtension(oldURL: feedsArray[indexPath.row].thumbnail_medium!), defaultImage:"VideoThumbail") {
                feedCell.videoThumbnail.contentMode = UIViewContentMode.scaleAspectFill
            }
            
            feedCell.videoDuration.text = CommonFunctions.secondsToHoursMinutesSeconds(seconds: feedsArray[indexPath.row].duration!)
            feedCell.videoTitle.text = feedsArray[indexPath.row].title
            feedCell.postedBy.text = feedsArray[indexPath.row].user_name
            feedCell.videoPlaysPostedTime.text = "\(feedsArray[indexPath.row].stats_number_of_plays!) plays • \(CommonFunctions.dateTimeToAgo(dateTime: feedsArray[indexPath.row].upload_date!))"
            return feedCell
        }
        
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        // Open Vault PIN Login View
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "detailVC") as! DetailViewController
        detailVC.feedData = feedsArray[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }

    
    // MARK: - To load the Feed data from the API
    func loadFeed(page:Int) {
        var request:URLRequest = URLRequest(url: URL(string: "http://vimeo.com/api/v2/album/58/videos.json?page=\(page)")!) // Creating Http Request
        request.httpMethod = "GET"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type")
        
        let defaultConfigObject = URLSessionConfiguration.default
        defaultConfigObject.timeoutIntervalForRequest = 15.0
        let defaultSession = URLSession(configuration: defaultConfigObject, delegate: nil, delegateQueue:OperationQueue.main)
        let task = defaultSession.dataTask(with: request, completionHandler: {
            responseData, response, error in
            if response != nil {
                let httpResponse = response as! HTTPURLResponse
                switch (httpResponse.statusCode) {
                case 200, 201, 401:
                    if error == nil {
                        DispatchQueue.main.async(execute: {

                            do {
                                let JSON = try JSONSerialization.jsonObject(with: responseData!, options:JSONSerialization.ReadingOptions(rawValue: 0))
                                guard let albumJSONArray = JSON as? Array<Any> else {
                                    print("Not an Array")
                                    // put in function
                                    return
                                }

                                for videoObj in albumJSONArray {
                                    let videoItem:Parser.AlbumVideos = Parser.AlbumVideos(jsonObject: videoObj as! NSDictionary)
                                    self.feedsArray.append(videoItem)
                                }
                                
                                self.currentPage += 1
                                
                                self.tableView.reloadData()
                            } catch let JSONError as NSError {
                                print("\(JSONError)")
                            } catch _ {
                                print("nil")
                            }
                        })
                    }
                    break;
                case 408:
                    print("request timeout")
                    break;
                default:
                    print("server error")
                }
            }
        })
        task.resume()
    }
}
