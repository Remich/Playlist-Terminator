--[[

VLC Playlist Terminator Extension for VLC media player
Copyright 2016 René Michalke

Authors: René Michalke
Contact: rene@renemichalke.de
Copyright 2016 René Michalke


-------------------------
License
-------------------------

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.


-------------------------
Information
-------------------------
This extension removes the last played item from the playlist.


-------------------------
Installation Instructions
-------------------------

Place this file in the corresponding folder and restart vlc or reload plugin extensions.

Linux:
  Current User: ~/.local/share/vlc/lua/extensions/
     All Users: /usr/lib/vlc/lua/extensions/

Windows:
  Current User: %APPDATA%\vlc\lua\extensions
     All Users: %ProgramFiles%\VideoLAN\VLC\lua\extensions\

Mac OS X:
  Current User: /Users/%your_name%/Library/Application Support/org.videolan.vlc/lua/extensions/
     All Users: /Applications/VLC.app/Contents/MacOS/share/lua/extensions/
     
--]]

function descriptor()
  return {
    title = "Playlist Terminator",
    version = "0.1",
    capabilities = { "playing-listener" },
    author = "René Michalke",
    shortdesc = "Removes the last played item from the playlist."
  }
end

function activate()
end

function deactivate()
end

function meta_changed()
end

function playing_changed()
  if last and last ~= vlc.playlist.current() then
    vlc.playlist.delete(last)
  end
  last = vlc.playlist.current()
end