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

            kgain chnget "gain"

            aSigCar oscili 1, 1000 ;Carrier Signal
            aSigMod oscili 1, 100  ;Modulator Signal

            aRM = aSigCar * aSigMod ;Ring Modulation
            aAM = aRM + aSigCar     ;Amplitude Modulation

            outs aAM * kgain, aAM * kgain

        endin

    </CsInstruments>
    
    <CsScore>
        ;causes Csound to run for about 7000 years...
        f0 z
        ;starts instrument 1 and runs it for a week
        i1 0 [60*60*24*7] 
    </CsScore>
    
</CsoundSynthesizer>
