sub init()
    m.top.backgroundUri = "pkg:/images/splash.png"
    
    ' Find the video player node from the XML
    m.myVideoPlayer = m.top.findNode("myVideoPlayer")
    
    ' Create a content node for the media stream
    content = CreateObject("roSGNode", "ContentNode")
    content.url = "https://www.eporner.com/dload/Kxm56XyGY2L/720/18368391-720p.mp4?click=1?click=1"
    content.title = "Test Stream"
    content.streamformat = "mp4"
    
    ' Feed it to the video player and kick off control
    m.myVideoPlayer.content = content
    m.myVideoPlayer.control = "play"
    
    ' Make sure the video node has UI focus
    m.myVideoPlayer.setFocus(true)
end sub
