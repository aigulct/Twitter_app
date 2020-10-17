//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Aigul Turdugulova on 10/9/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if toBeFavorited {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("Favorite didn't succeed: \(error)")
            })
        }
        else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("Unfavorite didn't succeed: \(error)")
            })
        }
    }
    @IBAction func retweet(_ sender: Any) {
        let toBeRetweeted = !retweeted
        if toBeRetweeted {
            TwitterAPICaller.client?.retweetTweet(tweetId: tweetId, success:{
                self.setRetweeted(true)
            }, failure: { (error) in
                print("Error in retweeting: \(error)")
            })
        }
        else {
            TwitterAPICaller.client?.unretweetTweet(tweetId: tweetId, success:{
                self.setRetweeted(false)
            }, failure: { (error) in
                print("Error in unretweeting: \(error)")
            })
        }
    }
    
    var favorited:Bool = false
    var tweetId:Int = -1
    var retweeted:Bool = false
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if favorited {
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    
    func setRetweeted(_ isRetweeted:Bool){
        retweeted = isRetweeted
        if retweeted {
            retweetButton.setImage(UIImage(named:"retweet-icon-green"), for: UIControl.State.normal)
            
        }
        else {
            retweetButton.setImage(UIImage(named:"retweet-icon"), for: UIControl.State.normal)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
