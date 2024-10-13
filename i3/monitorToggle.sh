#!/bin/bash

connected=$(xrandr | grep 'HDMI-2 connected')

# подключен ли монитор
if [[ -z "$connected" ]]; then
    echo 'Монитор не подключен'

    # выключим отображение, если вдруг оно активно (просто был выдернут шнур)
    xrandr --output HDMI-2 --off
else
	# монитор подключен
	# проверим отображается ли он
	displayed=$(xrandr | grep 'HDMI-2 connected 1920x1080+1920+0')

	if [[ -z "$displayed" ]]; then
		# не отображается, включим отображение
		echo 'не отображается, включим отображение'
		xrandr --output HDMI-2 --mode 1920x1080 --pos 1920x0
	else
		# отображается, выключим отображение
		echo 'отображается, выключим отображение'
		xrandr --output HDMI-2 --off
	fi
fi
