#!/bin/bash

return_value=0
output_norminette=$(norminette -R CheckDefine ./ | grep -c "Error")
random=$(($RANDOM% 1))

#No error normal operation
if	[[	$output_norminette -le $return_value ]]
then
	norminette -R CheckDefine ./
else
	#One chance equal to the modulo of random
	if [[ $random != $return_value ]] 
	then #different of result
		norminette -R CheckDefine ./
	else #equal of result
		pacmd set-default-sink 0 #set default audio output to the speakers
		pacmd set-sink-mute 0 0 #force unmute audio
		pacmd set-sink-volume 0 0x02000 #force volume to 20%
		cvlc -f ~/Videos/cheh.mp4 #start video with vlc (You can change path of this video)
		norminette -R CheckDefine ./ #make a normal commande norminette
	fi
fi
