<CsoundSynthesizer>

    <CsOptions>
        -n -d -+rtmidi=NULL -M0 -m0d 
    </CsOptions>

    <CsInstruments>
; Converted from the Cabbage version for csound7~ (Pure Data / Max).
; Controls arrive from the patch as channels (chnget) with the same names as the Cabbage widgets.
        ;Initialize the global variables. 
        ksmps = 10
        nchnls = 2
        0dbfs = 1

        instr 1

            iFrequenza = 400; iFrequenza is an instantaneous (i-type) variable and is used only once for the whole duration of the instrument
            ;it will be used to set constant values that must be used for the whole duration of the instrument.
            ;it is a much slower variable than the ones we have just seen, since it is used only once and we cannot
            ;change it for the whole duration of the instrument.
            ;IMPORTANT: it can be changed if the instrument is turned on and off several times - we will see this in the next example

            aSignal oscili 0.1, iFrequenza

            outs aSignal, aSignal

        endin

    </CsInstruments>

    <CsScore>
        ;causes Csound to run for about 7000 years...
        f0 z
        ;starts instrument 1 and runs it for a week
        i1 0 [60*60*24*7] 
    </CsScore>

</CsoundSynthesizer>
