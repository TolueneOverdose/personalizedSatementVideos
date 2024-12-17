#!/usr/bin/bash

_Fontpath='Roboto-Bold.ttf'

_Name_Line_1='Sandeep Kumar'
_Name_Line_2='Kushwaha'
_Logo_Ecas='ecas.png'

_Date='31st May, 2024'

_Portfolio_Amt='2,92,605'

_EP_Amt='63,646'

_MF_Amt='1,26,786'

_NPS_Amt='1,02,172'

_Prev_Amt='2,44,526'
_Change='19.66'




#
#Adding the word 'Dear' to the template video
#Adding the first line of the Name - 'Sandeep Kumar'
#Adding the second line of the Name - 'Kushwaha'
#	Note: Second line can be left blank if name can be occupied within one line
#Adding Text 'Welcome to your monthly consolidated account statement' 
#

 ffmpeg -i template.mp4 -filter_complex "[0:v] drawtext=alpha='if(lt(t,1),t,if(lt(t,6),1,if(lt(t,7),(1-(t-6)),0)))':text='Dear':fontcolor=black:fontfile='${_Fontpath}':fontsize=40:x='(w-text_w)/2':y=100[dearOut];[dearOut]drawtext=alpha='if(lt(t,1),(t),if(lt(t,6),1,if(lt(t,7),(1-(t-6)),0)))':text='${_Name_Line_1}':fontcolor=blue:fontfile='${_Fontpath}':fontsize=50:x=(w-text_w)/2:y=140[name1Out];[name1Out]drawtext=alpha='if(lt(t,1),t,if(lt(t,6),1,if(lt(t,7),(1-(t-6)),0)))':text='${_Name_Line_2}':fontcolor=blue:fontfile='${_Fontpath}':fontsize=50:x=(w-text_w)/2:y=195[name2Out];[name2Out]drawtext=alpha='if(lt(t,3),t-2,if(lt(t,6),1,if(lt(t,7),(1-(t-6)),0)))':text='Welcome to Your Monthly ':fontcolor=black:fontfile='${_Fontpath}':fontsize=35:x=(w-text_w)/2:y=260[text1Out];[text1Out]drawtext=alpha='if(lt(t,3),t-2,if(lt(t,6),1,if(lt(t,7),(1-(t-6)),0)))':text='Consolidated Account Statement ':fontcolor=black:fontfile='${_Fontpath}':fontsize=35:x=(w-text_w)/2:y=300[text2Out]" -map [text2Out] -y Intro1.mp4

#
#Adding Image of Ecas Logo
#


#
#Adding Text 'Track all your Assets with one Statement'
#
 ffmpeg -i Intro1.mp4 -filter_complex "[0:v] drawtext=alpha='if(lt(t,8),t-7,if(lt(t,15),1,if(lt(t,16),(1-(t-15)),0)))':text='Track all your Assets with one Statement':fontcolor=black:fontfile='${_Fontpath}':fontsize=30:x='(w-text_w)/2':y=100" -y Intro2.mp4
#
#Adding Images of - Equity Portfoliol, Physical Mutual Funds and National Pension Scheme
#

#
#Adding Text - 'Your Total Portfolio Value \n As of \n $Date \n is \n Rs. $EP_Amt
#
ffmpeg -i Intro2.mp4 -filter_complex "[0:v] drawtext=alpha='if(lt(t,17),t-16,if(lt(t,24),1,if(lt(t,25),(1-(t-24)),0)))':text='Your Total Portfolio':fontcolor=white:fontfile='${_Fontpath}':fontsize=30:x='(1400-text_w)/2':y=200[text1Out];[text1Out]drawtext=alpha='if(lt(t,17),t-16,if(lt(t,24),1,if(lt(t,25),(1-(t-24)),0)))':text='value as of':fontcolor=white:fontfile='${_Fontpath}':fontsize=30:x='(1400-text_w)/2':y=235[text2Out];[text2Out]drawtext=alpha='if(lt(t,19),t-18,if(lt(t,24),1,if(lt(t,25),(1-(t-24)),0)))':text='${_Date}':fontcolor=cyan:fontfile='${_Fontpath}':fontsize=35:x='(1400-text_w)/2':y=285[DateOut];[DateOut]drawtext=alpha='if(lt(t,21),t-20,if(lt(t,24),1,if(lt(t,25),(1-(t-24)),0)))':text='--is--':fontcolor=white:fontfile='${_Fontpath}':fontsize=30:x='(1400-text_w)/2':y=330[text3Out];[text3Out]drawtext=alpha='if(lt(t,22),t-21,if(lt(t,24),1,if(lt(t,25),(1-(t-24)),0)))':text='Rs. ${_Portfolio_Amt}':fontcolor=cyan:fontfile='${_Fontpath}':fontsize=35:x='(1400-text_w)/2':y=370[text4Out]" -map [text4Out] -y PortfolioValue.mp4

#
#Adding Text - 'Your Equity Portfolio Value \n As of \n $Date \n is \n Rs. $MF_Amt
#
ffmpeg -i PortfolioValue.mp4 -filter_complex "[0:v] drawtext=alpha='if(lt(t,28),t-27,if(lt(t,35),1,if(lt(t,36),(1-(t-35)),0)))':text='Your total Equity Portfolio':fontcolor=white:fontfile='${_Fontpath}':fontsize=30:x='(530-text_w)/2':y=200[text1Out];[text1Out]drawtext=alpha='if(lt(t,28),t-27,if(lt(t,35),1,if(lt(t,36),(1-(t-35)),0)))':text='value as of':fontcolor=white:fontfile='${_Fontpath}':fontsize=30:x='(530-text_w)/2':y=235[text2Out];[text2Out]drawtext=alpha='if(lt(t,30),t-29,if(lt(t,35),1,if(lt(t,36),(1-(t-35)),0)))':text='${_Date}':fontcolor=cyan:fontfile='${_Fontpath}':fontsize=35:x='(530-text_w)/2':y=285[DateOut];[DateOut]drawtext=alpha='if(lt(t,33),t-32,if(lt(t,35),1,if(lt(t,36),(1-(t-35)),0)))':text='--is--':fontcolor=white:fontfile='${_Fontpath}':fontsize=30:x='(530-text_w)/2':y=330[text3Out];[text3Out]drawtext=alpha='if(lt(t,34),t-33,if(lt(t,35),1,if(lt(t,36),(1-(t-35)),0)))':text='Rs. ${_EP_Amt}':fontcolor=cyan:fontfile='${_Fontpath}':fontsize=35:x='(530-text_w)/2':y=370[AmtOut]" -map [AmtOut] -y EP.mp4

#
#Adding Text - 'Your Total Mutual Funds Value \n As of \n $Date \n is \n Rs. $MF_Amt
#
ffmpeg -i EP.mp4 -filter_complex "[0:v] drawtext=alpha='if(lt(t,40),t-39,if(lt(t,47),1,if(lt(t,48),(1-(t-47)),0)))':text='Your Mutual Funds':fontcolor=white:fontfile='${_Fontpath}':fontsize=30:x='(530-text_w)/2':y=200[text1Out];[text1Out]drawtext=alpha='if(lt(t,40),t-39,if(lt(t,47),1,if(lt(t,48),(1-(t-47)),0)))':text='value as of':fontcolor=white:fontfile='${_Fontpath}':fontsize=30:x='(530-text_w)/2':y=235[text2Out];[text2Out]drawtext=alpha='if(lt(t,41),t-40,if(lt(t,47),1,if(lt(t,48),(1-(t-47)),0)))':text='${_Date}':fontcolor=cyan:fontfile='${_Fontpath}':fontsize=35:x='(530-text_w)/2':y=285[DateOut];[DateOut]drawtext=alpha='if(lt(t,44),t-43,if(lt(t,47),1,if(lt(t,48),(1-(t-47)),0)))':text='--is--':fontcolor=white:fontfile='${_Fontpath}':fontsize=30:x='(530-text_w)/2':y=330[text3Out];[text3Out]drawtext=alpha='if(lt(t,45),t-44,if(lt(t,47),1,if(lt(t,48),(1-(t-47)),0)))':text='Rs. ${_MF_Amt}':fontcolor=cyan:fontfile='${_Fontpath}':fontsize=35:x='(530-text_w)/2':y=370[AmtOut]" -map [AmtOut] -y MF.mp4




#
#Adding Text - 'NPS Investment\n Summary as of \n $Date \n is \n Rs. $NPS_Amt
#
ffmpeg -i MF.mp4 -filter_complex "[0:v] drawtext=alpha='if(lt(t,52),t-51,if(lt(t,59),1,if(lt(t,60),(1-(t-59)),0)))':text='NPS Investment':fontcolor=white:fontfile='${_Fontpath}':fontsize=30:x='(530-text_w)/2':y=200[text1Out];[text1Out]drawtext=alpha='if(lt(t,52),t-51,if(lt(t,59),1,if(lt(t,60),(1-(t-59)),0)))':text='summary as of':fontcolor=white:fontfile='${_Fontpath}':fontsize=30:x='(530-text_w)/2':y=235[text2Out];[text2Out]drawtext=alpha='if(lt(t,54),t-53,if(lt(t,59),1,if(lt(t,60),(1-(t-59)),0)))':text='${_Date}':fontcolor=cyan:fontfile='${_Fontpath}':fontsize=35:x='(530-text_w)/2':y=285[DateOut];[DateOut]drawtext=alpha='if(lt(t,56),t-55,if(lt(t,59),1,if(lt(t,60),(1-(t-59)),0)))':text='--is--':fontcolor=white:fontfile='${_Fontpath}':fontsize=30:x='(530-text_w)/2':y=330[text3Out];[text3Out]drawtext=alpha='if(lt(t,57),t-56,if(lt(t,59),1,if(lt(t,60),(1-(t-59)),0)))':text='Rs. ${_NPS_Amt}':fontcolor=cyan:fontfile='${_Fontpath}':fontsize=35:x='(530-text_w)/2':y=370[AmtOut]" -map [AmtOut] -y NPS.mp4



#
#Adding Text - "Your portfolio value as \n of one month ago was \n $Prev_Amt \n An increase in \n $Change"
#
ffmpeg -i NPS.mp4 -filter_complex "[0:v] drawtext=alpha='if(lt(t,63),t-62,if(lt(t,73),1,if(lt(t,74),(1-(t-73)),0)))':text='Your Portfolio value as':fontcolor=white:fontfile='${_Fontpath}':fontsize=30:x='(1400-text_w)/2':y=200[text1Out];[text1Out]drawtext=alpha='if(lt(t,63),t-62,if(lt(t,73),1,if(lt(t,74),(1-(t-73)),0)))':text='of one month ago was':fontcolor=white:fontfile='${_Fontpath}':fontsize=30:x='(1400-text_w)/2':y=235[text2Out];[text2Out]drawtext=alpha='if(lt(t,66),t-65,if(lt(t,73),1,if(lt(t,74),(1-(t-73)),0)))':text='Rs. ${_Prev_Amt}':fontcolor=cyan:fontfile='${_Fontpath}':fontsize=35:x='(1400-text_w)/2':y=285[prevOut];[prevOut]drawtext=alpha='if(lt(t,70),t-69,if(lt(t,73),1,if(lt(t,74),(1-(t-73)),0)))':text='An increase of':fontcolor=white:fontfile='${_Fontpath}':fontsize=30:x='(1400-text_w)/2':y=330[text3Out];[text3Out]drawtext=alpha='if(lt(t,71),t-70,if(lt(t,73),1,if(lt(t,74),(1-(t-73)),0)))':text='${_Change} Percent':fontcolor=cyan:fontfile='${_Fontpath}':fontsize=35:x='(1400-text_w)/2':y=370[ChangeOut]" -map [ChangeOut] -y Summary.mp4


#
#Adding Conclusion Text - "Please visit www.cdslindia.com \n and login to your account ot download \n your latest statements. \n\n Atlernately, you can call: \n 1800123456 \n for more details "
#
ffmpeg -i Summary.mp4 -filter_complex "[0:v] drawtext=alpha='if(lt(t,78),t-77,if(lt(t,96),1,if(lt(t,97),(1-(t-96)),0)))':text='Please visit www.cdslindia.com':fontcolor=white:fontfile='${_Fontpath}':fontsize=30:x='(w-text_w)/2':y=150[text1Out];[text1Out]drawtext=alpha='if(lt(t,78),t-77,if(lt(t,96),1,if(lt(t,97),(1-(t-96)),0)))':text='and login to your account to download':fontcolor=white:fontfile='${_Fontpath}':fontsize=30:x='(w-text_w)/2':y=185[text2Out];[text2Out]drawtext=alpha='if(lt(t,78),t-77,if(lt(t,96),1,if(lt(t,97),(1-(t-96)),0)))':text='your latest statements':fontcolor=cyan:fontfile='${_Fontpath}':fontsize=30:x='(w-text_w)/2':y=235[text3Out];[text3Out]drawtext=alpha='if(lt(t,78),t-77,if(lt(t,96),1,if(lt(t,97),(1-(t-96)),0)))':text='Alternately, you can call':fontcolor=white:fontfile='${_Fontpath}':fontsize=30:x='(w-text_w)/2':y=300[text4Out];[text4Out]drawtext=alpha='if(lt(t,78),t-77,if(lt(t,96),1,if(lt(t,97),(1-(t-96)),0)))':text='18000123456':fontcolor=cyan:fontfile='${_Fontpath}':fontsize=30:x='(w-text_w)/2':y=340[text5Out];[text5Out]drawtext=alpha='if(lt(t,78),t-77,if(lt(t,96),1,if(lt(t,97),(1-(t-96)),0)))':text='for more details':fontcolor=white:fontfile='${_Fontpath}':fontsize=30:x='(w-text_w)/2':y=375[text6Out]" -map [text6Out] -y Final.mp4


#ecas image
ffmpeg -i Final.mp4 -loop 1 -t 30 -i ecas.png -filter_complex "
[1:v]format=rgba,fade=t=in:st=3:d=1,fade=t=out:st=6:d=1[red_image];[0:v][red_image]overlay=330:340:enable='between(t,5,7)'" -c:a copy ecas_video.mp4

#EP
ffmpeg -i ecas_video.mp4 -loop 1 -t 30 -i EP.png -filter_complex "
[1:v]format=rgba,scale=440:60,fade=t=in:st=8:d=2:alpha=1,fade=t=out:st=15:d=1:alpha=1[red_image];[0:v][red_image]overlay=260:150:enable='between(t,9,16)'" -c:a copy EP_img.mp4

#MF
ffmpeg -i EP_img.mp4 -loop 1 -t 30 -i MF.png -filter_complex "
[1:v]format=rgba,scale=440:60,fade=t=in:st=11:d=2:alpha=1,fade=t=out:st=14.7:d=1:alpha=1[red_image];[0:v][red_image]overlay=260:245:enable='between(t,11,16)'" -c:a copy MF_img.mp4

#Portfolio_summary
ffmpeg -i MF_img.mp4 -loop 1 -t 30 -i Portfolio_Summary.png -filter_complex "
[1:v]scale=480:-1,fade=t=in:st=16:d=1:alpha=1,fade=t=out:st=23:d=1:alpha=1[red_image];
[0:v][red_image]overlay=10:150:enable='between(t,16,24)'" -c:a copy portfolio_summary.mp4

ffmpeg -i portfolio_summary.mp4 -filter_complex "
scale=8000:-1, zoompan=z='if(between(in_time,17,20),pzoom+0.01,if(between(in_time,20,22),pzoom,pzoom-0.02))':x='(iw/2-(iw/zoom/2))/4':y='(ih/2-(ih/zoom/2))*1.2':d=1:s=1280x720:fps=25" -c:a copy -y portfolio_output.mp4

#bar_graph
ffmpeg -i portfolio_output.mp4 -loop 1 -t 110 -i Bar_Graph.png -filter_complex "
[1:v]scale=550:-1,fade=t=in:st=75:d=1:alpha=1,fade=t=out:st=89:d=1:alpha=1[red_image];
[0:v][red_image]overlay=20:100:enable='between(t,74,91)'" -c:a copy bar_graphh.mp4

ffmpeg -i bar_graphh.mp4 -filter_complex "
scale=8000:-1, zoompan=z='if(between(in_time,78,81),pzoom+0.01,if(between(in_time,81,85),pzoom,pzoom-0.02))':x='(iw/2-(iw/zoom/2))/4':y='(ih/2-(ih/zoom/2))*1.2':d=1:s=1280x720:fps=25" -c:a copy -y bar_graph_out.mp4

#pie_chart_1(Equity)
ffmpeg -i bar_graph_out.mp4 -loop 1 -t 110 -i Pie_Chart.png -filter_complex "
[1:v]scale=550:-1,fade=t=in:st=33:d=1:alpha=1,fade=t=out:st=42:d=1:alpha=1[red_image];
[0:v][red_image]overlay=700:200:enable='between(t,32,43)'" -c:a copy pie_chart_1.mp4

ffmpeg -i pie_chart_1.mp4 -filter_complex "
scale=8000:-1,zoompan=z='if(between(in_time,33,36),pzoom+0.01,if(between(in_time,36,39),pzoom,pzoom-0.02))':x='(iw/2-(iw/zoom/2))*1.8':y='(ih/2-(ih/zoom/2))*1.2':d=1:s=1280x720:fps=25" -c:a copy -y pie_chart_1_out.mp4

#pie_chart_2(MF)
ffmpeg -i pie_chart_1_out.mp4 -loop 1 -t 110 -i Pie_Chart.png -filter_complex "
[1:v]scale=550:-1,fade=t=in:st=46:d=1:alpha=1,fade=t=out:st=56:d=1:alpha=1[red_image];
[0:v][red_image]overlay=670:200:enable='between(t,45,57)'" -c:a copy pie_chart_2.mp4

ffmpeg -i pie_chart_2.mp4 -filter_complex "
scale=8000:-1,zoompan=z='if(between(in_time,48,51),pzoom+0.01,if(between(in_time,51,54),pzoom,pzoom-0.02))':x='(iw/2-(iw/zoom/2))*1.8':y='(ih/2-(ih/zoom/2))*1.2':d=1:s=1280x720:fps=25" -c:a copy -y pie_chart_2_out.mp4

#pie_chart_3(NPS)
ffmpeg -i pie_chart_2_out.mp4 -loop 1 -t 110 -i Pie_Chart.png -filter_complex "
[1:v]scale=550:-1,fade=t=in:st=62:d=1:alpha=1,fade=t=out:st=71:d=1:alpha=1[red_image];
[0:v][red_image]overlay=670:200:enable='between(t,61,72)'" -c:a copy pie_chart_3.mp4

ffmpeg -i pie_chart_3.mp4 -filter_complex "
scale=8000:-1,zoompan=z='if(between(in_time,63,66),pzoom+0.01,if(between(in_time,66,69),pzoom,pzoom-0.02))':x='(iw/2-(iw/zoom/2))*1.8':y='(ih/2-(ih/zoom/2))*1.2':d=1:s=1280x720:fps=25" -c:a copy -y pie_chart_3_out.mp4


aws polly synthesize-speech --output-format mp3 --engine standard --voice-id Raveena --text-type ssml --text "<speak>
	Dear
	<lang xml:lang='en-IN'>${_Name_Line_1} ${_Name_Line_2}</lang>
	<p>
  	  Welcome to your monthly Consolidated Account Statement from CDSL.
	</p>
	<break time='1.5s'/>
	Track all your assets in one statement like, Equity Portfolio, Physical Mutual Funds, and, National Pension Scheme
	<break time='2s'/>
	Your total portfolio value as of ${_Date}, is, rupees <lang xml:lang='en-IN'>${_Portfolio_Amt}</lang>.
	<break time='4s'/>
        	Your Equity portfolio value as of ${_Date}, is , rupees <lang xml:lang='en-IN'>${_EP_Amt}</lang>.
	<break time='5s'/>
            	Your Mutual Fund Value as of ${_Date}, is , rupees <lang xml:lang='en-IN'>${_MF_Amt}</lang>.
	<break time='4s'/>
            	Your National Pension Scheme Value as of ${_Date}, is, rupees <lang xml:lang='en-IN'>${_NPS_Amt}</lang>.
	<break time='5s'/>
	Your portfolio value as of one month ago was rupees, <lang xml:lang='en-IN'>${_Prev_Amt}</lang> <break time='1.5s'/>, an increase of ${_Change} percent.
	<break time='6s'/>
	For more details on your transactions and holdings, please visit the link below.
	<break time='1s'/>
	We hope that this personalized video statement has been useful.
	Visit www dot CDSL India dot com and login to your account to download your latest statements.
</speak>" Polly_Audio.mp3 --region ap-south-1

ffmpeg -i pie_chart_3_out.mp4 -i Polly_Audio.mp3 -i Background_Music.mp3 -filter_complex "[2:a]volume=0.1[a2];[1:a][a2]amerge=inputs=2[a];[a]afade=t=out:st=108:d=2[aout]" -map 0:v -map "[aout]" -c:v copy -c:a aac -ac 2 -shortest Final_With_Aud.mp4
