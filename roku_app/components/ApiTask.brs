sub init()
    m.top.functionName = "executeRequest"
end sub

sub executeRequest()
    if m.top.targetUrl <> ""
        request = CreateObject("roUrlTransfer")
        request.SetCertificatesFile("common:/certs/ca-bundle.crt")
        request.InitClientCertificates()
        
        encodedUrl = request.UrlEncode(m.top.targetUrl)
        apiUrl = "http://172.238.179.5:8000/feed?url=" + encodedUrl
        
        request.SetUrl(apiUrl)
        m.top.response = request.GetToString()
    end if
end sub
