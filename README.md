Introduction:
The primary source of relaying information about bank statements are pdf documents. Reading pdfs is boring and time consuming. Pdfs are highly detailed and users do not want to scroll through it to get the information they want. A solution to this problem are video statements shared on media sharing apps like Whatsapp. 

There are various advantage to using video statements  including:
Enhanced Accessibility: Provide customers with an easy-to-understand, auditory summary of their financial statements.
Improved Engagement: Increase customer engagement by presenting information in a visually appealing and interactive format.
Efficiency: Streamline the process of conveying complex financial information, saving time for both customers and financial institutions.
Reduced Friction: Having information relayed via Whatsapps on mobile phones is more convenient than checking mails
Objective:
Converting statement pdfs into short videos shareable via Whatsapp to communicate the relevant information a customer usually checks in their statements.
The video will be a minute long and will summarize the crucial information like current and previous year portfolio value, percentage increase/decrease between them.
The video will also feature the required graphs and diagrams extracted from the pdf.
A voice-over audio to narrate all the information visible on the screen and guide the viewer throughout the video will be present.
Approach:
A python/perl script is executed for extracting the information to be displayed in the video statement, this information is then merged with the template video using FFMpeg using various cli commands.
Amazon Polly will be used for voice over generation needed to be overlaid on the base video to narrate the information to the user.



Prerequisites about video formatting:
Video Containers
A video container is a file format that encapsulates various data streams related to a video. These data streams typically include:
Video Stream: The actual visual data of the video, encoded in a specific video codec.
Audio Stream: The sound data, encoded in an audio codec.
Subtitles: Text data that may be displayed as subtitles.
Metadata: Information about the video, such as title, author, and chapters.
Popular video containers include formats like MP4, AVI, and MKV. They function like a "wrapper" that bundles these different streams together into a single file, ensuring that all the components are synchronized during playback.

Codecs
A codec (short for "coder-decoder") is a tool used to compress and decompress the video and audio streams within a container. There are two main types of codecs:
Video Codec: Compresses video data to reduce file size and decompresses it for playback. Examples include H.264, H.265 (HEVC), and VP9.
Audio Codec: Compresses audio data. Examples include AAC, MP3, and Opus.
When you play a video file, the media player reads the container to identify which codecs were used to encode the streams and then uses the corresponding codecs to decode the video and audio for playback.
Example
Consider an MP4 file:
Container: MP4 (organizes and holds all data streams)
Video Codec: H.264 (compresses video data)
Audio Codec: AAC (compresses audio data)
Subtitles: Optional text stream
Metadata: Info like file title, creation date, etc.
The container ensures that the video and audio stay in sync, while the codecs handle the compression and decompression, making efficient storage and high-quality playback possible.
 Aspect Ratio:
Definition: Aspect ratio is the proportion between the width and height of an image or video frame.
Format: Expressed as two numbers separated by a colon, such as 16:9 or 4:3.
Common Ratios:
16:9 (HD and Full HD videos) 	b. 4:3 (standard definition)

Example:
For a video with a resolution of 1920x1080 pixels:
Aspect ratio = 1920 / 1080 = 16:9
This means the video frame is 16 units wide for every 9 units in height.
Importance: Maintaining the correct aspect ratio ensures that images and videos display correctly without distortion or stretching, preserving the intended visual composition.
Base Template Video:
The template video is a rough outline and does not contain any information about the customer, the information is extracted from the  statement pdf  and is  merged into the template video using FFMpeg. The voice over is done using  amazon polly. 
