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

kTrans chnget "trans"

ifftsize  = 2048
ioverlap  = ifftsize / 4
iwinsize  = ifftsize
iwinshape = 1							;von-Hann window
Sfile chnget "audiofile1"
ain,ain2       soundin Sfile

Sfile2 chnget "audiofile2"
ain3,ain4     soundin Sfile2

;ain oscili 1, 400
;ain3 oscili 1, 500


;ktrans linseg 0,5,1


fsig     pvsanal ain, ifftsize, ioverlap, iwinsize, iwinshape	;fft-analysis of the audio-signal
fsig2     pvsanal ain3, ifftsize, ioverlap, iwinsize, iwinshape	;fft-analysis of the audio-signal

fsig pvsmorph fsig, fsig2 ,kTrans , kTrans
 
aout      pvsynth fsig					;resynthesis
          outs	  aout, aout
endin




</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
; (started from the patch) i1 0 [60*60*24*7]
</CsScore>
</CsoundSynthesizer>
