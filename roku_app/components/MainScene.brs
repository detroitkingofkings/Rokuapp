sub init()
    m.videoPlayer = m.top.findNode("videoPlayer")
    fetchAndPlay("https://www.xnxx.com/video-118314115/sample_video")
end sub

sub fetchAndPlay(targetUrl as String)
    m.apiTask = CreateObject("roSGNode", "ApiTask")
    m.apiTask.targetUrl = targetUrl
    m.apiTask.observeField("response", "onResponseReceived")
    m.apiTask.control = "RUN"
end sub

sub onResponseReceived()
    jsonStr = m.apiTask.response
    if jsonStr <> "" and jsonStr <> invalid
        json = ParseJson(jsonStr)
        if json <> invalid and json.stream_url <> invalid
            videoContent = CreateObject("roSGNode", "ContentNode")
            videoContent.url = json.stream_url
            videoContent.streamFormat = "mp4"
            
            m.videoPlayer.content = videoContent
            m.videoPlayer.control = "play"
        end if
    end if
end sub
