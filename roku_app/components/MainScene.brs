sub init()
    m.top.setFocus(true)

    m.videoPlayer = m.top.findNode("videoPlayer")
    if m.videoPlayer = invalid then
        print ">>> [ERROR] Could not find 'videoPlayer' node!"
        return
    end if

    videoContent = createObject("RoSGNode", "ContentNode")
    videoContent.url = "https://www.w3schools.com/html/mov_bbb.mp4"
    videoContent.streamformat = "mp4"

    m.videoPlayer.content = videoContent
    m.videoPlayer.control = "play"
    m.videoPlayer.setFocus(true)
end sub
