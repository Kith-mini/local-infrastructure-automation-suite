from flask import Flask, jsonify
import requests
import time

app = Flask(__name__)

URLS = [
    "http://my_local_server:80",
    "https://google.com"
]

@app.get("/")
def home():
    return """
    <h1>Local Infrastructure Automation Suite</h1>
    <p>Live Monitoring Dashboard</p>
    <ul>
      <li><a href='/status'>/status</a> (JSON)</li>
    </ul>
    """

@app.get("/status")
def status():
    results = []
    for url in URLS:
        start = time.time()
        try:
            r = requests.get(url, timeout=3)
            latency = round((time.time() - start) * 1000, 2)
            results.append({
                "url": url,
                "status": "UP" if r.status_code < 400 else "DOWN",
                "code": r.status_code,
                "latency_ms": latency
            })
        except Exception as e:
            results.append({
                "url": url,
                "status": "DOWN",
                "error": str(e)
            })
    return jsonify(results)
