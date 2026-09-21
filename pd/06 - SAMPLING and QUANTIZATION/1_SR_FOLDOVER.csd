<CsoundSynthesizer>

    <CsOptions>
        -n -d -+rtmidi=NULL -M0 -m0d 
    </CsOptions>

    <CsInstruments>
; Converted from the Cabbage version for csound7~ (Pure Data / Max).
; Controls arrive from the patch as channels (chnget) with the same names as the Cabbage widgets.
    ; Initialize the global variables. 
    ksmps = 1
    nchnls = 2
    0dbfs = 1

    instr 1
        iScaleFactor = 4; from 1 to sr/2
        iSR = 44100 / iScaleFactor

        kFold = sr / iSR ;CHANGE FOLDOVER

        aSig oscili 1, 11025

        a0ut fold aSig , kFold ;FOLDOVER

        outs a0ut, a0ut
        endin

    </CsInstruments>

    <CsScore>
        ;causes Csound to run for about 7000 years...
        f0 z
        ;starts instrument 1 and runs it for a week
        i1 0 [60*60*24*7] 
    </CsScore>

</CsoundSynthesizer>
