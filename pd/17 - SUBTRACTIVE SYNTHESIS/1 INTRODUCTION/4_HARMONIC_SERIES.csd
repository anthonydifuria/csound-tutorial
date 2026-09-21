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
kGain chnget "gain" ; Controls the output amplitude
kfreqBandPass chnget "freqBandPass"; Controls the band center frequency in hz
kWidhtBand chnget "band"; bandwidth in hz


aPinkNoise pinker ; Pink noise generator
a1 butterbp aPinkNoise, kfreqBandPass * 1, kWidhtBand ;Band-Pass filter
a2 butterbp aPinkNoise, kfreqBandPass * 2, kWidhtBand ;Band-Pass filter
a3 butterbp aPinkNoise, kfreqBandPass * 3, kWidhtBand ;Band-Pass filter
a4 butterbp aPinkNoise, kfreqBandPass * 4, kWidhtBand ;Band-Pass filter
a5 butterbp aPinkNoise, kfreqBandPass * 5, kWidhtBand ;Band-Pass filter

aOut = (a1 + a2 + a3 + a4 + a5) / 5

outs aOut*kGain, aOut*kGain ;Filtered Sound Output

endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
i1 0 [60*60*24*7] 
</CsScore>
</CsoundSynthesizer>
