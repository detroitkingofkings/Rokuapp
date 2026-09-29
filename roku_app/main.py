from fastapi import FastAPI, Query
import requests
import urllib.parse

app = FastAPI()

@app.get("/feed")
def get_stream(url: str = Query(...)):
    # If the Roku app sends a search query or category, map it to the official API
    query_str = "squirting" # default fallback
    if "search/" in url:
        parts = url.split("search/")
        if len(parts) > 1 and parts[1].strip("/"):
            query_str = parts[1].split("/")[0]

    api_endpoint = f"https://www.eporner.com/api/v2/video/search/?query={query_str}&per_page=1&format=json"
    print(f"--- DEBUG: Querying Official API: {api_endpoint}")

    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36"
    }
    
    try:
        response = requests.get(api_endpoint, headers=headers, timeout=10)
        data = response.json()
        
        # Extract the direct mp4 stream from the official JSON response
        videos = data.get("videos", [])
        if videos:
            vid = videos[0]
            # Eporner API provides direct mp4 links or source definitions
            # Let's check for default mp4 or construct it
            mp4_url = vid.get("default_mp4", "")
            if not mp4_url and "mp4" in vid:
                mp4_url = vid["mp4"]
                
            if mp4_url:
                print(f"--- DEBUG: Got API stream URL: {mp4_url}")
                return {"stream_url": mp4_url}
                
        return {"stream_url": "", "error": "No videos found in API response"}
        
    except Exception as e:
        print(f"--- DEBUG: API Error: {str(e)}")
        return {"stream_url": "", "error": str(e)}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
