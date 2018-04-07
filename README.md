# Matlab-Simulator

[Overview of the experiment]

(Please refer to Schematic overview slide, too)
Notes:
・ This experiment will be done inside a brain scanner.
・ The task consists of two blocks; the first half (block 1) and the second (block 2), each has 10 trials (20 trials in total).
・ One trial consists of three phases; ‘picture presentation’ (3s), ‘picture presentation & rating response’ (4s), and ‘inter-trial interval’ (3s±1s). 
・ Order of the presentation of pictures is pre-defined for each participant by an experimenter. So it would be better if the program can load a presentation sequence from a DAT file, for example.
・ Would you make the script in the way that I can change Instruction text and picture presentation order for each participants later.
・ My matlab coding skill is basic. So it would be great if you would put comments in the script so that I can amend them (like duration, text etc) later. Of course, you do not have to make comments on every single line but on ones critical for amending those parameters. 
I especially appreciate if you make a bit detailed comments on the ‘Rating response’ phase for my own education if possible.


It goes roughly like this…

① Program starts
	Registration of participant’s information
② First resting period (20s) with a small circle on black screen
③ Fixation cross (1s)
Block starts = ‘block onset’
④ Instruction text on the screen (4s) 
⑤ Picture presentation (3s)
first trial onset ‘trial onset’
⑥ Picture presentation + Rating response (4s)
	Participant makes his/her rating
⑦ Inter-trial interval with fixation cross (3s jittered with 1s)
⑧ The next trial begins
(…10 trials in the first block…)
⑨ Resting period with a small circle on black screen (30s)
⑩ same as ③-⑨
⑪ All data will be stored and close the program
 


Data and results to be stored:

1) Time of which the entire program starts (absolute time)
2) Time of which each block starts, block onset
3) Time of which each trial starts, trial onset
4) Response time for each trial; response time is the time which is taken to decide an answer from ‘trial onset’ time as 0 (relative time).
5) Rating for each trial
6) Picture file name for each trial
7) Participant’s info



Details are as following:

① Program starts
Registering participant’s information; ID number and notes
These information should be stored in result file.

② First resting period (20s) with a small circle on black screen
White circle appears on the middle of the screen 

③ Fixation cross (1s)
Cross (+) appears on the screen
Block starting time = it is used as ‘block onset’

④ Instruction text on the screen (4s) 
At the beginning of each block, an instruction text is presented in the middle of the screen for 4 s.
An instruction is just one short sentence, like ‘Peer like’.

⑤ Picture presentation (3s)
First trial starting time = it is used as ‘trial onset’
Participants passively view during this period.

⑥ Picture presentation + Rating response (4s)
Then a response period comes up, with the picture still remaining on the screen, but discrete 7-point scale appears in the bottom of the screen below the picture. 
Participant makes his/her rating.

(How to respond) Please refer to Rating response description slide, too.
Discrete 7-point ratings using a button box with three buttons (or QWE keys): 
Participants use the right index finger to shift a cursor (grey) one point leftward in the scale, the middle finger to shift it one point rightward, and then decide by pressing a button with the ring finger. 
When a participant decides his/her rating the rating should be marked as red to indicate.

Record rating and response time here.

⑦ Inter-trial interval with fixation cross (3s jittered with 1s)
Fixation point appears in the middle of the screen. 
Duration is 3 s on average with ±1 s jitter randomly.

⑧ The next trial begins

(…10 trials in the first block…)

⑨ Resting period with a small circle on black screen (30s)
When the first 10 trials are finished, there is a resting period between 1st and 2nd block for 30 s.
White circle is presented on the screen.

⑩ same as ③-⑨
Then block 2 starts. The procedure is the same as the block 1 but with different set of pictures.

⑪ All data will be stored and close the program
