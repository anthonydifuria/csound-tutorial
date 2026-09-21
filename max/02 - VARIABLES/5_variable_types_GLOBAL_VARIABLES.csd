<CsoundSynthesizer>

    <CsOptions>
        -n -d -+rtmidi=NULL -M0 -m0d 
    </CsOptions>

    <CsInstruments>
; Converted from the Cabbage version for csound7~ (Pure Data / Max).
; Controls arrive from the patch as channels (chnget) with the same names as the Cabbage widgets.
        ; Initialize the global variables. 
        ksmps = 10
        nchnls = 2
        0dbfs = 1

        instr 1

            ;the global variable is of type "g" and is used when we need to exchange (audio streams, control values and instantaneous values between different instruments)
            gkGlissato linseg 400, 10, 1000

        endin

        instr 2

            aSignal oscili 0.1, gkGlissato
            outs aSignal, aSignal

        endin

    </CsInstruments>

    <CsScore>
        ;causes Csound to run for about 7000 years...
        f0 z

        i1 0 [60*60*24*7] ;turns on instrument 1
        i2 0 [60*60*24*7] ;turns on instrument 2
    </CsScore>

</CsoundSynthesizer>
