"""
  A script to create and set labelled wallpapers to mark your spaces.
  Sherif / hi@sherif.io

  It's not pretty, but it works well enough for me.

  > python3 spacewall.py "~/Pictures/gooddoggo.jpg" primary
"""

from sys import argv
import os
import subprocess

from PIL import Image, ImageFont, ImageDraw
from PIL import JpegImagePlugin

def get_resolution():
    """
    Return the display's resolution.
    This function may not work properly when run on the non-primary display on a multidisplay setup.
    """
    display = subprocess.Popen(['osascript', '-'],
                               stdin=subprocess.PIPE,
                               stdout=subprocess.PIPE,
                               encoding='utf8')
    resolutions = display.communicate(
            'tell application "Finder" to get bounds of window of desktop'
            )[0]
    resolutions = resolutions.replace('\n', '').split(', ')
    resolutions = [int(xx) for xx in resolutions]
    return resolutions

def crop_center(image: JpegImagePlugin.JpegImageFile, displaydim: list[int, int]):
    """
    Crop the provided base wallpaper to provided dimensions.
    """
    iw, ih = image.size
    if (iw < displaydim[0]) or (ih < displaydim[1]):
        raise ValueError(f'Image dimensions must be smaller than the display which is '
                         f'{displaydim[0]} × {displaydim[1]}.')

    left = (iw - displaydim[0]) / 2
    top = (ih - displaydim[1]) / 2
    right = (iw + displaydim[0]) / 2
    bottom = (ih + displaydim[1]) / 2

    return image.crop((left, top, right, bottom))


def set_wallpaper(basepaper: str, title: str):
    """
    Give this function a path to the wallpaper, a title, it'll do the rest.
    """
    displaydim = get_resolution()[2:4]
    img = Image.open(basepaper)
    cropped_img = crop_center(img, displaydim)

    font = ImageFont.truetype("/Library/Fonts/Georgia.ttf", 46)

    draw = ImageDraw.Draw(cropped_img)
    draw.text((displaydim[0] - 250, displaydim[1] - 80), title, (255, 255, 0), font=font)
    draw.text((20, displaydim[1] - 80), title, (255, 255, 0), font=font)
    os.makedirs('/Users/sherif/Pictures/spacewallpapers', exist_ok=True)
    cropped_img.save(f'/Users/sherif/Pictures/spacewallpapers/{title}.jpg', quality=95)

    osa = subprocess.Popen(["osascript", "-"],
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            encoding='utf8')

    osa.communicate(f'tell application "Finder" to set desktop picture to '
                    f'POSIX file "/Users/sherif/Pictures/spacewallpapers/{title}.jpg"')

    subprocess.Popen(['killall', 'Dock'],
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            encoding='utf8')


if __name__ == '__main__':
    set_wallpaper(argv[1], argv[2])
