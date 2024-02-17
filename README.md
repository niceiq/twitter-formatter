# Twitter Formatter
This script will convert any video to a format that is supported by Twitter/X. 

I designed it because I often post trade executions on my Twitter page 
[@adamemoustaine](https://twitter.com/adamemoustaine) and I had a lot of trouble 
uploading vidoes after they have been recorded. 

This script also automatically speeds up videos to 120 seconds if needed. If you 
don't need that feature and want to post longer video, you can simply comment 
out the following line: 

```sh 
-vf "setpts=$SPEED_PTS*PTS" \
```


## Features
   *  Convert file to mp4
   *  Change encoding and pixel format to a widely supported web format.
   *  Speed up videos to 120 seconds.

This script will replace the original file with the formatted file. If you want 
to disable that feature, comment out the following line: 

```sh 
mv "$OUTPUT_FILE" "$INPUT_FILE" 
```

## Usage 

Very simple usage. Run the script in the command line: 

```sh
./formatter.sh input_file.mp4
```

Alternatively, you can add the shell script to your binaries and run it directly 
from the terminal. 
