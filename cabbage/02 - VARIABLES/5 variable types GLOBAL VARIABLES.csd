<Cabbage>

    form caption("Untitled") size(400, 300), guiMode("queue") pluginId("def1")
    rslider bounds(296, 162, 100, 100), channel("gain"), range(0, 1, 0, 1, .01), text("Gain"), trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")

</Cabbage>

<CsoundSynthesizer>

    <CsOptions>
        -n -d -+rtmidi=NULL -M0 -m0d 
    </CsOptions>

    <CsInstruments>
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
