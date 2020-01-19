function maketimelapse -d "Uses ffmpeg to make a timelapse in a folder of jgp files. Accepts fps as arg."
    ffmpeg -r $argv -pattern_type glob -i '*.jpg' -vcodec libx264 -pix_fmt yuv420p __$argv.mp4
end
