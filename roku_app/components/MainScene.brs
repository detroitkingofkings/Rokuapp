sub init()
    print ">>> [DEBUG] MainScene init started"
    m.top.backgroundUri = "pkg:/images/splash.png"
    
    ' Find the video player node from the XML
    m.myVideoPlayer = m.top.findNode("myVideoPlayer")
    if m.myVideoPlayer = invalid then
        print ">>> [ERROR] Could not find 'myVideoPlayer' node in XML!"
        return
    end if
    
    print ">>> [DEBUG] Creating ContentNode..."
    content = CreateObject("roSGNode", "ContentNode")
    content.url = "https://www.eporner.com/dload/Kxm56XyGY2L/720/18368391-720p.mp4?click=1?click=1"
    content.title = "Test Stream"
    content.streamformat = "mp4"
    
    print ">>> [DEBUG] Assigning content and setting play command..."
    m.myVideoPlayer.content = content
    m.myVideoPlayer.control = "play"
    
    print ">>> [DEBUG] Setting focus to video player..."
    m.myVideoPlayer.setFocus(true)
    print ">>> [DEBUG] Init finished successfully"
end sub
