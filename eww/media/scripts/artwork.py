#Most of the code is stolen from https://github.com/felipemarinho97/musnify-mpd/blob/master/musnify-mpd.py

import requests
import json
import os
import gi
import sys
import re

gi.require_version('Notify', '0.7')
gi.require_version('GdkPixbuf', '2.0')

from gi.repository.Gio import File
from gi.repository.GdkPixbuf import Pixbuf
from mpd import MPDClient
# import dotenv
# os.getenv


# def get_artwork(artist, album):
#     url = "http://ws.audioscrobbler.com/2.0/?method=album.getinfo&api_key=8d79accd55fc7ce636685d747099fab0"
#     url += "&artist=" + artist + "&album=" + album + "&format=json"

#     response = requests.gept(url)

#     imageurl = response.json()['album']['image'][3]['#text']
#     print(response)
#     print(url)
# print(get_artwork("VISXGE", "IMMACULATE"))
apiKey = "8d79accd55fc7ce636685d747099fab0"
debug = False

class MPDWrapper:
    def __init__(self, host="localhost", port="6600"):
        self.client = MPDClient()
        self.client.timeout = 1
        self.client.idletimeout = None
        self.client.connect(host, port)

    def getCurrentSong(self):
        song = self.client.currentsong()

        try:
            artist = song["artist"]
        except KeyError:
            song["artist"] = "Unknown Artist"

        try:
            album = song["album"]
        except KeyError:
            song["album"] = "Unknown Album"

        try:
            title = song["title"]
        except KeyError:
            try:
                song["title"] = song["file"].split("/")[-1]
            except KeyError:
                song["title"] = "Unknown Title"

        return song

class CoverArt:
    @staticmethod
    def fetchAlbumCoverURL(artist, album, size=1):
        apiUrl = 'http://ws.audioscrobbler.com/2.0/?method=album.getinfo'

        if not 'apiKey' in globals():
            return False

        apiReqUrl = apiUrl + '&artist=' + artist + '&album=' + album + '&api_key=' + apiKey + '&format=json'
        r = requests.get(apiReqUrl)

        dataInfo = json.loads(r.content)

        try:
            assert dataInfo["error"] > 0
            if debug:
                print("Nothing found on last fm")
            return False
        except:
            url = dataInfo["album"]["image"][size]["#text"]
            if url == "":
                if debug:
                    print("Nothing found on last fm")
                return False
            return url

    @staticmethod
    def downloadPixbufAlbumCover(url):
        if debug:
            print("downloading album cover from " + url)

        f = File.new_for_uri(url)
        stream = f.read()

        cover = Pixbuf.new_from_stream(stream)
        stream.close()
        return cover

    @staticmethod
    def fetchLocalCover(path):
        regex = re.compile(r'(album|cover|\.?folder|front).*\.(gif|jpeg|jpg|png)$', re.I | re.X)
        try:
            for e in os.listdir(path):
                if regex.match(e) != None:
                    if debug:
                        print("local cover found at " + path + e)
                    return Pixbuf.new_from_file(path + e)
        except:
            pass
        if debug:
            print("Nothing found on local directory")
        return False
# mpd = MPDWrapper()
# old_song = {"title": ""}
# while True:
#     song = mpd.getCurrentSong()
#     # print("test")
#     if song["title"] != old_song["title"]:
#         old_song = song
#         album_name = song["album"]
#         artist_name = song["artist"]

#         local_cover = CoverArt.fetchLocalCover(f"/home/cole/Music/CoverArt/{artist_name}/{album_name}/")
#         if local_cover:
#             # print(local_cover)
#             open("/home/cole/.config/eww/media/scripts/artwork.txt", "a").write(local_cover)

#         else:
#             cover_url = CoverArt.fetchAlbumCoverURL(artist_name, album_name)

#             if cover_url: 
#                 cover = CoverArt.downloadPixbufAlbumCover(CoverArt.fetchAlbumCoverURL(artist_name, album_name)).save_to_bufferv("png", [], [])[1]
#                 try:
#                     with open(f"/home/cole/Music/CoverArt/{artist_name}/{album_name}.png", "wb") as f:
#                         f.write(cover)
#                 except FileNotFoundError:
#                     os.mkdir(f"/home/cole/Music/CoverArt/{artist_name}")
#                     with open(f"/home/cole/Music/CoverArt/{artist_name}/{album_name}.png", "wb") as f:
#                         f.write(cover)
#                 finally:
#                     # print(f"/home/cole/Music/CoverArt/{artist_name}/{album_name}.png")
#                     open("/home/cole/.config/eww/media/scripts/artwork.txt", "a").write(f"/home/cole/Music/CoverArt/{artist_name}/{album_name}.png")
#             else:
#                 # print("/home/cole/Music/CoverArt/NoCover.png")
#                 open("/home/cole/.config/eww/media/scripts/artwork.txt", "a").write("/home/cole/Music/CoverArt/NoCover.png")
song = MPDWrapper().getCurrentSong()
album_name = song["album"]
artist_name = song["artist"]

local_cover = CoverArt.fetchLocalCover(f"/home/cole/Music/CoverArt/{artist_name}/{album_name}/")
if local_cover:
    print(local_cover)

else:
    cover_url = CoverArt.fetchAlbumCoverURL(artist_name, album_name)

    if cover_url:
        cover = CoverArt.downloadPixbufAlbumCover(cover_url).save_to_bufferv("png", [], [])[1]

        try:
            with open(f"/home/cole/Music/CoverArt/{artist_name}/{album_name}.png", "wb") as f:
                f.write(cover)
        except FileNotFoundError:
            os.mkdir(f"/home/cole/Music/CoverArt/{artist_name}")
            with open(f"/home/cole/Music/CoverArt/{artist_name}/{album_name}.png", "wb") as f:
                f.write(cover)
        finally:
            print(f"/home/cole/Music/CoverArt/{artist_name}/{album_name}.png")

