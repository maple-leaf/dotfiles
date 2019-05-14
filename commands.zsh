fucntion togif() {
    echo $1
    ffmpeg -i "$1" -s 300x200 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > "$1.gif"
}
