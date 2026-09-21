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

        ihopsize = 32
        ifftsize = 4096 
        iolaps = ifftsize/ihopsize 
        ibw = sr/ifftsize
        kcnt init 0 
        krow init 0

        kOla[] init ifftsize 
        kIn[] init ifftsize 
        kOut[][] init iolaps, ifftsize 
        kAmps[] init ifftsize
        kCent[] init ifftsize
        kSpread[] init ifftsize

        a1  oscili 1,100;SIGNAL 
 
        if kcnt == ihopsize then  
            kWin[] window kIn,krow*ihopsize
            kSpec[] rfft kWin

            kAmps[] mags kSpec;FFT AMPLITUDES

            kAMP sumarray kAmps;SUM OF FFT AMPLITUDES
    
            kIndex = 0
            until kIndex == ifftsize / 2  do
                kCent[kIndex] = ((ibw) * kIndex) * (kAmps[kIndex]) / (kAMP);COMPUTE THE CENTROID 
                kIndex += 1
            od
            kCENROID sumarray kCent;SUM
            printk 0.5, kCENROID

            kIndex2 = 0
            until kIndex2 == ifftsize / 2  do
                kSpread[kIndex2] = (ibw * kIndex2 - kCENROID) ^ 2 * (kAmps[kIndex2]) / (kAMP)
                kIndex2 += 1
            od
            kSPREAD sumarray (kSpread)
            ;printk 0.1, sqrt(kSPREAD)
   
            krow = (krow+1)%iolaps
            kcnt = 0
        endif

        kIn shiftin a1

        kcnt += ksmps

        endin

    </CsInstruments>

    <CsScore>
    ;causes Csound to run for about 7000 years...
    f0 z
    ;starts instrument 1 and runs it for a week
    i1 0 [60*60*24*7] 
    </CsScore>
</CsoundSynthesizer>
