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


ifftsize  = 2048 
ioverlap  = ifftsize / 4
iwinsize  = ifftsize
iwinshape = 1							;von-Hann window
Sfile chnget "audiofile1"
ain,ain2 diskin Sfile, 1, 0, 1

fftin pvsanal ain, ifftsize, ioverlap, iwinsize, iwinshape	;fft-analysis of the audio-signal

    kIn[] init ifftsize
    kOut[] init ifftsize   
    
   kframe  pvs2tab kIn , fftin ; copy fft data into an array

kCount init 0

    if kCount >= ioverlap then
         
         ;copya2ftab kIn, giIn ; Copy data from a vector to an f-table.
          kOut = kIn
         ;copyf2array kOut , giOut ; Copy data from an f-table to a vector.
        
         kCount = 0  
        
    endif
     
    fOut1 tab2pvs kOut, ioverlap, iwinsize, iwinshape ;copy an array into an fft signal
 
    aout pvsynth fOut1

    outs aout, aout
          
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
