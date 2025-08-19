import requests

class EventAPI:
    def __init__(self,data_plane_url,write_key):
        if not data_plane_url.startswith("http"):
            raise ValueError(f"Invalid Data Plane URL: {data_plane_url}")
        self.data_plane_url = data_plane_url
        self.write_key = write_key

    def send_track_event(self, user_id, event_name, properties=None):
        url = f"{self.data_plane_url}/v1/track"
        payload = {
            "writeKey": self.write_key,
            "event": event_name,
            "userId": user_id,
            "properties": properties or {}
        }
        response = requests.post(url, json=payload, auth = (self.write_key,""))
        return response.status_code, response.text

    def send_identify_event(self, user_id, traits=None):
        url = f"{self.data_plane_url}/v1/identify"
        payload = {
            "writeKey": self.write_key,
            "userId": user_id,
            "traits": traits or {}
        }
        response = requests.post(url, json=payload, auth = (self.write_key,""))
        return response.status_code, response.text
