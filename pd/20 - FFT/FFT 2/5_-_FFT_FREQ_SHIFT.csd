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

kFreeze chnget "freeze"

ifftsize  = 4096
ibw = sr / ifftsize ; BIN BANDWIDTH
iNumBin = ifftsize / 2
giTabSize = (ifftsize / 2) + 2
ioverlap  = ifftsize / 4
iwinsize  = ifftsize
iwinshape = 1							;von-Hann window
Sfile chnget "audiofile1"
ain,ain2 diskin Sfile, 1, 0, 1

fftin     pvsanal ain, ifftsize, ioverlap, iwinsize, iwinshape	;fft-analysis of the audio-signal

    kInMag[] init giTabSize
    kInFreq[] init giTabSize
    kOutMag[] init giTabSize
    kOutFreq[] init giTabSize

    
   kframe  pvs2tab kInMag, kInFreq, fftin ; Copies spectral data to k-rate arrays

kCount init 0 
  kFreq = 100
    kShiftFreq = int(abs(kFreq) / ibw) 


    if kCount >= ioverlap then
 
   ki = 0 
   until ki == iNumBin do
   
   kShift = int(ki * ((iNumBin - kShiftFreq) / iNumBin)) + kShiftFreq
   
   kOutMag[kShift] = kInMag[ki]
   kOutFreq[kShift] = kInFreq[ki]

     ki += 1
   od

    
    ;kOutFreq = kInFreq
        
       kCount = 0  
        
    endif
     
    fOut1 tab2pvs kOutMag, kOutFreq, ioverlap, iwinsize, iwinshape
 
    aout pvsynth fOut1

    out aout , aout 
          
    kCount = kCount + 32 
endin




</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
; (started from the patch) i1 0 [60*60*24*7]
</CsScore>
</CsoundSynthesizer>
