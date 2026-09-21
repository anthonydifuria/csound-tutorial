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

gifftsize  = 256
ioverlap  = gifftsize / 4
iwinsize  = gifftsize
iwinshape = 1							;von-Hann window


Sfile2 chnget "audiofile1"
ain1,ain2 diskin Sfile2, 1, 0, 1

;ktrans linseg 0,5,1

gfsigL     pvsanal ain1, gifftsize, ioverlap, iwinsize, iwinshape	;fft-analysis of the audio-signal
gfsigR     pvsanal ain2, gifftsize, ioverlap, iwinsize, iwinshape	;fft-analysis of the audio-signal


 
 ktrig metro gifftsize
 gkDur = 3
 schedkwhen ktrig,0,0,2,0,gkDur

endin

instr 2


kBins = int(rnd(gifftsize/4) + 1)
    kampL, kfrL pvsbin gfsigL, kBins
    kampR, kfrR pvsbin gfsigR, kBins

	aSigL oscili i(kampL) * 0.1, i(kfrL) * 0.25
	aSigR oscili i(kampR) * 0.1, i(kfrR) * 0.25
		aEnv linseg 0, i(gkDur) / 16, 1, i(gkDur) / 2, 0
          outs	  aSigL * aEnv, aSigR* aEnv

endin


</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
; (started from the patch) i1 0 [60*60*24*7]
</CsScore>
</CsoundSynthesizer>
