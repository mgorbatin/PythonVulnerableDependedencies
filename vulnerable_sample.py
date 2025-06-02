import requests

redirecting_url = "http://localhost:8000"

try:
    response = requests.get(redirecting_url, allow_redirects=True)
    print("Final URL:", response.url)
    print("Response content:\n", response.text)
except Exception as e:
    print("Error:", e)