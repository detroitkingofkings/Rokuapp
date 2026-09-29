sub init()
    m.video = m.top.findNode("myVideo")
    m.video.control = "play"
    fetchAndPlay("https://www.xnxx.com/video-XXXXX/example_video_title")
end sub

sub fetchAndPlay(targetUrl as String)
    request = CreateObject("roUrlTransfer")
    apiUrl = "http://172.238.179.5:8000/feed?url=" + request.UrlEncode(targetUrl)
    request.SetUrl(apiUrl)
    request.SetCertificatesFile("common:/certs/ca-bundle.crt")
    
    response = request.GetToString()
    json = ParseJson(response)
    
    if json <> invalid and json.stream_url <> invalid
        videoContent = CreateObject("roSGNode", "ContentNode")
        videoContent.url = json.stream_url
        videoContent.title = json.title
        videoContent.streamformat = "hls"
        
        m.video.content = videoContent
        m.video.control = "play"
    end if
end sub
