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

 ihopsize = 128   ;OVERLAP SIZE
 ifftsize = 1024  ;FFT SIZE 
 iolaps = ifftsize/ihopsize ;OVERLAPS
 ibw = sr/ifftsize ; BIN BANDWIDTH
 kcnt init 0    ;COUNTER
 krow init 0

 kOla[] init ifftsize ;BUFFER OVERLAPS
 kIn[] init ifftsize  ;INPUT BUFFER
 kOut[][] init iolaps, ifftsize ;OUTPUTS BUFFER
 
 Sfile chnget "audiofile1";FILE PATH
 a1, a2 diskin Sfile, 1, 0, 1    ;FILE PLAYER     

if kcnt >= ihopsize then

 ;/-------FFT-------/
 kWin[] window kIn, krow * ihopsize ;WINDOWS FFT
 kSpec[] rfft kWin ;FFT
 
 
   iFreq = 3000 ;CUTOFF FREQUENCY
   iBandeHIGHPASS = int((iFreq) / ibw) ;NUMBER OF HIGHPASS BANDS
   
   ki = 0 
   until ki == int(ifftsize) do
   
   if ki < iBandeHIGHPASS then
   kSpec[ki] = 0
   endif
   
     ki += 1
   od
 
   ;/-------IFFT-------/
   kRow[] rifft kSpec
   kWin window kRow, krow * ihopsize
   
   ;OUT BUFFER
   kOut setrow kWin, krow

   ;BUFFER OVERLAPS
   kOla = 0
   ;ADD OVERLAPS
   ki = 0
   until ki == iolaps do
     kRow getrow kOut, ki
     kOla = kOla + kRow
     ki += 1
   od
  
  ;COUNTER
  krow = (krow + 1) % iolaps ;OVERLAPS COUNTER
  kcnt = 0 ;FFT COUNTER RETURNS TO 0
 endif

 ;WRITE AND READ ONE-DIMENSIONAL BUFFER
 kIn shiftin a1
 a2 shiftout kOla / iolaps
    out a2

 ;FFT COUNTER INCREMENT
 kcnt += ksmps
 
endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
; (started from the patch) i1 0 [60*60*24*7]
</CsScore>
</CsoundSynthesizer>
