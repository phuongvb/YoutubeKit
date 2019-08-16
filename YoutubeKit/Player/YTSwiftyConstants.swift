//
//  YTSwiftyConstants.swift
//  YTSwiftyPlayer
//
//  Created by Ryo Ishikawa on 12/30/2017
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

/**
 An state of current player
 
 - seealso: [IFrame Player API](https://developers.google.com/youtube/iframe_api_reference#Playback_status)
 */
public enum YTSwiftyPlayerState: Int {
    case unstarted  = -1
    case ended      = 0
    case playing    = 1
    case paused     = 2
    case buffering  = 3
    case cued       = 4
}

/**
 An event type of player
 
 - seealso: [IFrame Player API](https://developers.google.com/youtube/iframe_api_reference#Events)
 */
public enum YTSwiftyPlayerEvent: String {
    case onYoutubeIframeAPIReady        = "onYouTubeIframeAPIReady"
    case onYouTubeIframeAPIFailedToLoad = "onYouTubeIframeAPIFailedToLoad"
    case onReady                        = "onReady"
    case onStateChange                  = "onStateChange"
    case onQualityChange                = "onPlaybackQualityChange"
    case onPlaybackRateChange           = "onPlaybackRateChange"
    case onApiChange                    = "onApiChange"
    case onError                        = "onError"
    case onUpdateCurrentTime            = "onUpdateCurrentTime"
}

/**
 An quality of video
 
 - seealso: [IFrame Player API](https://developers.google.com/youtube/iframe_api_reference#Playback_quality)
 */
public enum YTSwiftyVideoQuality: String {
    case small      = "small"
    case medium     = "medium"
    case large      = "large"
    case hd720      = "hd720"
    case hd1080     = "hd1080"
    case highres    = "highres"
    case unknown
}

/**
 An error of player
 
 - seealso: [IFrame Player API](https://developers.google.com/youtube/iframe_api_reference#Events)
 */

public enum YTSwiftyPlayerError: Int {
    case invalidURLRequest  = 2
    case html5PlayerError   = 5
    case videoNotFound      = 100
    case videoNotPermited   = 101
    case videoLicenseError  = 150
}

/// The color that will be used in the player's video progress bar to highlight the amount of the video that the viewer has already seen. Default value is `red`.
public enum VideoProgressBarColor: String {
    case red
    case white
}

/// This parameter indicates whether the video player controls are displayed. Default value is `show`.
public enum VideoControlAppearance: Int {
    case hidden = 0
    case show = 1
}

/// The list parameter, in conjunction with the listType parameter, identifies the content that will load in the player.
public enum VideoListType: String {
    ///  The list parameter value specifies the search query.
    case search = "search"
    /// The list parameter value identifies the YouTube channel whose uploaded videos will be loaded.
    case userUploads = "user_uploads"
    /// The list parameter value specifies a YouTube playlist ID. In the parameter value, you need to prepend the playlist ID with the letters PL as shown in the example below.
    case playlist = "playlist"
}

/// The video annotation policy values. Default value is `show`.
public enum VideoAnnotationPolicy: Int {
    case show = 1
    case hidden = 3
}

/**
 The policy for related videos that are shown after the initial video is finished. The default value is `showAll`.
 https://developers.google.com/youtube/player_parameters?playerVersion=HTML5#release_notes_08_23_2018
 */
public enum RelatedVideoPolicy: Int {
    /// The player will show related videos that are from the same channel as the video that was just played.
    case sameChannelOnly = 0
    /// The player does show related videos from all video sources.
    case showAll = 1
}


/**
 All available parameters for YouTube Embedded Players. These parameters are optional.
 - note: This enum does not provide `autoplay` **by intension** because it NEVER works due to the restriction of WebKit (or Safari) in iOS,
 that is, a video must be muted to be autoplayed. And there is no way to mute the video player in YouTube iframe API BEFORE the autoplay kicks in.
 See https://developers.google.com/web/updates/2016/07/autoplay for more info.
 - seealso: [Player Parameters](https://developers.google.com/youtube/player_parameters?playerVersion=HTML5)
 */
public enum VideoEmbedParameter {
    
    /**
     This parameter specifies the default language that the player will use to display captions. Set the parameter's value to an ISO 639-1 two-letter language code.
     If you use this parameter and also set the cc_load_policy parameter to 1, then the player will show captions in the specified language when the player loads.
     If you do not also set the cc_load_policy parameter, then captions will not display by default, but will display in the specified language if the user opts to turn captions on.
     
     - seealso: [ISO 639-1](http://www.loc.gov/standards/iso639-2/php/code_list.php)
     */
    case captionLanguage(String)
    
    /// If the value is `true`, It causes closed captions to be shown by default, even if the user has turned captions off. Default value is based on user preference.
    case alwaysShowCaption(Bool)
    
    /**
     This parameter specifies the color that will be used in the player's video progress bar to highlight the amount of the video that the viewer has already seen. Valid parameter values are red and white, and, by default, the player uses the color red in the video progress bar. See the YouTube API blog for more information about color options.
     
     - note: Setting the color parameter to white will disable the modestbranding option.
     */
    case progressBarColor(VideoProgressBarColor)
    
    /**
     This parameter indicates whether the video player controls are displayed.
     
     - note: The parameter values `show` and `showAfterPlaying` are intended to provide an identical user experience, but `showAfterPlaying` provides a performance improvement over `show` for IFrame embeds. Default value is `show`.
     */
    case showControls(VideoControlAppearance)
    
    /// Setting the parameter's value to `true` causes the player to not respond to keyboard controls. Default value is `false`.
    case disableKeyboardControl(Bool)
    
    /// Setting the parameter's value to `true` enables the player to be controlled via IFrame or JavaScript Player API calls. Default value is `false`.
    case enableJavaScriptAPI(Bool)
    
    /**
     This parameter causes the player to begin playing the video at the given number of seconds from the start of the video. The parameter value is a positive integer.
     
     - note: Similar to the seekTo function, the player will look for the closest keyframe to the time you specify. This means that sometimes the play head may seek to just before the requested time, usually no more than around two seconds.
     */
    case registerStartTimeAt(Int)
    
    /**
     This parameter specifies the time, measured in seconds from the start of the video, when the player should stop playing the video. The parameter value is a positive integer.
     
     - note: The time is measured from the beginning of the video and not from either the value of the start player parameter or the startSeconds parameter, which is used in YouTube Player API functions for loading or queueing a video.
     */
    case registerEndTimeAt(Int)
    
    /// Setting this parameter to `false` prevents the fullscreen button from displaying in the player. Default value is `true`, which causes the fullscreen button to display.
    case showFullScreenButton(Bool)
    
    /**
     This parameter represents the player's interface language. The parameter value is an ISO 639-1 two-letter language code or a fully specified locale. The interface language is used for tooltips in the player and also affects the default caption track.
     
     - note: YouTube might select a different caption track language for a particular user based on the user's individual language preferences and the availability of caption tracks.
     - seealso: [ISO 639-1](http://www.loc.gov/standards/iso639-2/php/code_list.php)
     */
    case playerLanguage(String)
    
    /// Setting the parameter's value to `show` causes video annotations to be shown by default, whereas setting to `hidden` causes video annotations to not be shown by default. The default value is `show`.
    case annotationPolicy(VideoAnnotationPolicy)
    
    /// The listType parameter, in conjunction with the list parameter, identifies the content that will load in the player.
    case listType(VideoListType)
    
    /// The list parameter, in conjunction with the `listType` parameter, identifies the content that will load in the player.
    case list(String)
    
    /**
     In the case of a single video player, a setting of `true` causes the player to play the initial video again and again. In the case of a playlist player, the player plays the entire playlist and then starts again at the first video.
     
     - note: This parameter has limited support in the AS3 player and in IFrame embeds, which could load either the AS3 or HTML5 player. This library uses video player based on HTML5, so this will work.
     */
    case loopVideo(Bool)
    
    /**
     This parameter lets you use a YouTube player that does not show a YouTube logo. Set the parameter value to `true` to prevent the YouTube logo from displaying in the control bar.
     - note: A small YouTube text label will still display in the upper-right corner of a paused video when the user's mouse pointer hovers over the player.
     */
    case showModestbranding(Bool)
    
    /// This parameter provides an extra security measure for the IFrame API and is only supported for IFrame embeds. If you are using the IFrame API, which means you are setting the enablejsapi parameter value to 1, you should always specify your domain as the origin parameter value.
    case origin(String)
    
    /// This parameter specifies a comma-separated list of video IDs to play.
    case playlist(String)
    
    /// This parameter specifies a video ID to play.
    case videoID(String)
    
    /// This parameter controls whether videos play inline or fullscreen. Default value is `false`.
    case playsInline(Bool)
    
    /// This parameter indicates how the player should show related videos when playback of the initial video ends. Default value is `showAll`.
    case relatedVideoPolicy(RelatedVideoPolicy)
    
    /**
     This parameter identifies the URL where the player is embedded.
     This value is used in YouTube Analytics reporting when the YouTube player is embedded in a widget, and that widget is then embedded in a web page or application.
     In that scenario, the origin parameter identifies the widget provider's domain, but YouTube Analytics should not identify the widget provider as the actual traffic source. Instead, YouTube Analytics uses the widget_referrer parameter value to identify the domain associated with the traffic source.
     */
    case widgetReferrer(String)

    /// Setting the parameter's value to `false` causes the player to not display information like the video title and uploader before the video starts playing. If the player is loading a playlist, and you explicitly set the parameter value to 1, then, upon loading, the player will also display thumbnail images for the videos in the playlist. Note that this functionality is only supported for the AS3 player.
    case showInfo(Bool)

    /// The player parameter.
    public var property: (key: String, value: AnyObject) {
        switch self {
        case .captionLanguage(let isoCode):
            return ("cc_lang_pref", isoCode as AnyObject)
        case .alwaysShowCaption(let isOn):
            return ("cc_load_policy", isOn.jsValue)
        case .progressBarColor(let color):
            return ("color", color.rawValue as AnyObject)
        case .showControls(let controls):
            return ("controls", controls.rawValue as AnyObject)
        case .disableKeyboardControl(let isDisable):
            return ("disablekb", isDisable.jsValue)
        case .enableJavaScriptAPI(let isOn):
            return ("enablejsapi", isOn.jsValue)
        case .registerStartTimeAt(let time):
            return ("start", time as AnyObject)
        case .registerEndTimeAt(let time):
            return ("end", time as AnyObject)
        case .showFullScreenButton(let isShow):
            return ("fs", isShow.jsValue)
        case .playerLanguage(let isoCode):
            return ("hl", isoCode as AnyObject)
        case .annotationPolicy(let annotationPolicy):
            return ("iv_load_policy", annotationPolicy.rawValue as AnyObject)
        case .listType(let type):
            return ("listType", type.rawValue as AnyObject)
        case .list(let value):
            return ("list", value as AnyObject)
        case .loopVideo(let isLoop):
            return ("loop", isLoop.jsValue)
        case .showModestbranding(let isShow):
            return ("modestbranding", isShow.jsValue)
        case .origin(let domain):
            return ("origin", domain as AnyObject)
        case .playlist(let playlist):
            return ("playlist", playlist as AnyObject)
        case .videoID(let id):
            return ("videoId", id as AnyObject)
        case .playsInline(let isOn):
            return ("playsinline", isOn.jsValue)
        case .relatedVideoPolicy(let relatedVideoPolicy):
            return ("rel", relatedVideoPolicy.rawValue as AnyObject)
        case .widgetReferrer(let domain):
            return ("widget_referrer", domain as AnyObject)
        case .showInfo(let isShow):
            return ("showinfo", isShow.jsValue)
        }
    }
}
