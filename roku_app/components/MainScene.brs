sub init()
    m.videoPlayer = m.top.findNode("videoPlayer")
    m.statusLabel = m.top.findNode("statusLabel")
    
    if m.videoPlayer <> invalid
        m.videoPlayer.setFocus(true)
    end if
    
    fetchAndPlay("https://spankbang.com/83u1l/video/")
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
        if json <> invalid and json.stream_url <> invalid and json.stream_url <> ""
            m.statusLabel.text = "Playing stream..."
            
            videoContent = CreateObject("roSGNode", "ContentNode")
            videoContent.url = json.stream_url
            videoContent.streamFormat = "mp4"
            
            m.videoPlayer.content = videoContent
            m.videoPlayer.control = "play"
        else
            m.statusLabel.text = "Error: Backend returned invalid stream URL"
        end if
    else
        m.statusLabel.text = "Error: Failed to connect to backend at 172.238.179.5:8000"
    end if
end sub
