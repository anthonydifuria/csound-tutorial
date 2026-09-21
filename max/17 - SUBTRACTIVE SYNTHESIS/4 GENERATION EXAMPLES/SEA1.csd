<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d 
</CsOptions>
<CsInstruments>
; Converted from the Cabbage version for csound7~ (Pure Data / Max).
; Controls arrive from the patch as channels (chnget) with the same names as the Cabbage widgets.
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1


instr 1
kGain chnget "gain"

;aSig mpulse 1,1 ;pulse generator

aNoise pinker; pink noise generator

krand randomh 500,5000,1 ;random number generator (generates one random number per second from 500 to 5000)
kport portk krand, 1 ;number follower e.g. from 500 to 600 progressive change
kosci oscili kport,0.1 ;

;printk2 kosci

aRes reson aNoise, kosci+100, 3000
aRes tone aRes, 2000

amod oscili 1,0.05
aSum = aRes * (abs(amod)+0.1)

outs aSum*0.01,aSum*0.01
endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
i1 0 [60*60*24*7] 
</CsScore>
</CsoundSynthesizer>
