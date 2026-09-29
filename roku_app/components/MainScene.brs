sub init()
    print ">>> [DEBUG] MainScene init started"
    m.top.backgroundUri = "pkg:/images/splash.png"
    
    ' Explicitly grab the Video node by matching ID
    m.videoPlayer = m.top.findNode("videoPlayer")
    if m.videoPlayer = invalid then
        print ">>> [ERROR] Could not find 'videoPlayer' node in MainScene.xml!"
        return
    end if
    
    print ">>> [DEBUG] Creating ContentNode..."
    videoContent = CreateObject("roSGNode", "ContentNode")
    videoContent.url = "https://www.eporner.com/dload/Kxm56XyGY2L/720/18368391-720p.mp4?click=1?click=1"
    videoContent.title = "Test Stream"
    videoContent.streamformat = "mp4"
    
    print ">>> [DEBUG] Assigning content and triggering playback..."
    m.videoPlayer.content = videoContent
    m.videoPlayer.control = "play"
    m.videoPlayer.setFocus(true)
    
    print ">>> [DEBUG] Init finished successfully"
end sub
