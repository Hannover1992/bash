#!/bin/bash


screenshot_directory="/home/uczen/Pictures/Screenshots"
screenshot_name="temp"
screenshot_name_resize="temp_resize"

screenshot_path="$screenshot_directory/$screenshot_name.png"
#screenshot_path_resized="$screenshot_directory/$screenshot_name_resize.png"

# Erstelle den Ordner falls er nicht existiert
mkdir -p "$screenshot_directory"

# Überprüfe, ob das Bild `temp.png` bereits existiert und lösche es, falls ja
if [ -f "$screenshot_path" ]; then
	    rm "$screenshot_path"
fi

# Überprüfe, ob das Bild `temp_resize.png` bereits existiert und lösche es, falls ja
#if [ -f "$screenshot_path_resized" ]; then
#    rm "$screenshot_path_resized"
#fi

# Erstelle den Screenshot mit scrot und speichere ihn als temp.png
scrot -s "$screenshot_path"

# Skaliere das Bild um 50% herunter
#convert "$screenshot_path" -resize 50% "$screenshot_path"

# Kopiere das neue Bild in die Zwischenablage
xclip -selection clipboard -t image/png -i "$screenshot_path"

# Öffne das gespeicherte Bild mit dem Standard-Bildbetrachter
sxiv "$screenshot_path"

# Alternative: Wenn du einen spezifischen Bildbetrachter verwenden möchtest, z.B. eog (Eye of GNOME)
# eog "$screenshot_path"

# Wenn du das skalierte Bild öffnen möchtest, kannst du es auch hier tun
#convert "$screenshot_path" -resize 25% "$screenshot_path_resized"
#xclip -selection clipboard -t image/png -i "$screenshot_path_resized"
#xdg-open "$screenshot_path_resized"
# eog "$screenshot_path_resized"

