sub init()
    m.top.setFocus(true)
    
    m.videoPlayer = m.top.findNode("myVideoPlayer")
    
    videoContent = createObject("RoSGNode", "ContentNode")
    videoContent.url = "https://www.w3schools.com/html/mov_bbb.mp4"
    videoContent.streamformat = "mp4"
    
    m.videoPlayer.content = videoContent
    m.videoPlayer.control = "play"
end sub
