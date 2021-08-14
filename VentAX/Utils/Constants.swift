//
//  Constance.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 05/04/21.
//

import Foundation

class Constants{
    public static let VERSION = "v2/"
    public static let MAIN_URL = "https://idaxmx.com/Ventax/"
    public static let MIDDLE_URL = "interface.php?function="
    public static let END_POINT = "\(MAIN_URL)\(VERSION)\(MIDDLE_URL)"
    public static let IOS = 1
    
    public static let APP_URL_FACEBOOK = "fb"
    public static let APP_URL_INSTAGRAM = "instagram"
    public static let APP_URL_TWITTER = "twitter"
    public static let APP_URL_WHATS = ""
    public static let APP_URL = "://user?screen_name="
    
    public static let WEB_URL_FACEBOOK = "https://facebook.com/"
    public static let WEB_URL_INSTAGRAM = "https://instagram.com/"
    public static let WEB_URL_TWITTER = "https://twitter.com/"
    
    //MARK: - DRAWER
    public static let POS_MENU = 0
    public static let POS_PROFILE = 1
    public static let POS_CART = 2
    public static let POS_COMPANY = 3
    public static let POS_ORDER = 4
    public static let POS_PRODUCT = 5
    public static let POS_SETTINGS = 6
    public static let POS_FAQ = 7
    public static let POS_IDAX = 8
    public static let POS_LOG_OUT = 9
    
    
    //MARK: - PRIORITY -> ACCOUNT_TYPE
    public static let PRIORITY_BASIC = 0
    public static let PRIORITY_PREMIUM = 1
    public static let PRIORITY_BUSINESS = 2
    
    //MARK: - ITEMS
    public static let ITEM_BASIC = 10
    public static let ITEM_PREMIUM = 20
    public static let ITEM_BUSINESS = 40
    
    //MARK: - FAQs
    public static let FAQ_BASIC = 3
    public static let FAQ_PREMIUM = 8
    public static let FAQ_BUSINESS = 15
    
    //MARK: - TYPE -> COMPANY/CLIENT
    public static let CANCEL_BY_COMPANY = 12
    public static let CANCEL_BY_CLIENT = 13
    
    //MARK: - EXTRA
    public static let AFFILIATE = 1
    public static let NOT_AFFILIATE = 0
    public static let AS_COMPANY = 0
    public static let AS_USER = 1
    
    //MARK: - ORDER STATE
    public static let PENDING = 0
    public static let ACEPTED = 1
    public static let PROCCESS = 2
    public static let FINISHED = 3
    public static let CANCELED = 4
    
    //MARK: - TYPE VIEW -> COMPANY/USER
    public static let COMPANY_VIEW = 50//false
    public static let USER_VIEW = 51//true
    
    
    //MARK: - UserDefaults
    public static let APNsToken:String = "APNsToken"
    public static let IS_LOGGED_KEY = "IS_LOGGED_KEY"
    
    public static let SOCIAL_MEDIA_FACEBOOK_IMG = "socialmedia_facebook"
    public static let SOCIAL_MEDIA_TWITTER_IMG = "socialmedia_twitter"
    public static let SOCIAL_MEDIA_INSTAGRAM_IMG = "socialmedia_instagram"
    public static let SOCIAL_MEDIA_WEB_IMG = "socialmedia_web"
    public static let SOCIAL_MEDIA_WHATS_IMG = "socialmedia_whats"
}
