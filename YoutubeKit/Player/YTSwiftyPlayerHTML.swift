//
//  YTSwiftyPlayerHTML.swift
//  YoutubeKit
//
//  Created by Ono Masashi on 2018/12/05.
//

import Foundation

class YTSwiftyPlayerHTML {
    static func htmlString(playerArgs: String) -> String {
        return """
        <!DOCTYPE html>
        <html>
        <head>
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <style>
        html,
        body {
        margin: 0;
        padding: 0;
        width: 100%;
        height: 100%;
        background-color: #000000;
        }
        </style>
        </head>
        <body>
        <div id="player"></div>
        <div id="explain"></div>
        <script src="https://www.youtube.com/iframe_api" onerror="webkit.messageHandlers.onYouTubeIframeAPIFailedToLoad.postMessage('')"></script>
        <script>
        var player;
        var time;
        YT.ready(function () {
        player = new YT.Player('player', \(playerArgs));
        webkit.messageHandlers.onYouTubeIframeAPIReady.postMessage('');
        function updateTime() {
        var state = player.getPlayerState();
        if (state == YT.PlayerState.PLAYING) {
        time = player.getCurrentTime();
        webkit.messageHandlers.onUpdateCurrentTime.postMessage(time);
        }
        }
        window.setInterval(updateTime, 500);
        });
        function onReady(event) {
        webkit.messageHandlers.onReady.postMessage('');
        }
        function onStateChange(event) {
        webkit.messageHandlers.onStateChange.postMessage(event.data);
        }
        function onPlaybackQualityChange(event) {
        webkit.messageHandlers.onPlaybackQualityChange.postMessage(event.data);
        }
        function onPlaybackRateChange(event) {
        webkit.messageHandlers.onPlaybackRateChange.postMessage(event.data);
        }
        function onPlayerError(event) {
        webkit.messageHandlers.onError.postMessage(event.data);
        }
        function onApiChange(event) {
        webkit.messageHandlers.onApiChange.postMessage(event.data);
        }
        </script>
        </body>
        </html>
        """
    }
}
