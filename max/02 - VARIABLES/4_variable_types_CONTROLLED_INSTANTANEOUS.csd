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

        ktrig metro 1; sends a trigger every second to schedkwhen, which will turn on instrument 2 for a duration of 0.5 seconds
        schedkwhen ktrig, 0,0,2,0,0.5
        ;WE WILL SEE HOW THIS PROCESS WORKS IN DETAIL

        endin

        instr 2

        ; Every time instrument 2 is called (turned on), the value of iFrequenza will change randomly between 400 and 500
        iFrequenza = 400 + rnd(100) ;(400 lowest value) + (rnd(100) random value between 0 and 100)

        print iFrequenza

        aSignal oscili 0.1, iFrequenza
        ;outs aSignal, aSignal

        endin

    </CsInstruments>

    <CsScore>
        ;causes Csound to run for about 7000 years...
        f0 z
        ;starts instrument 1 and runs it for a week
        i1 0 [60*60*24*7] ;NOTE THAT INSTRUMENT 1 IS ALWAYS ON and instrument 2 IS TURNED ON by schedkwhen
    </CsScore>

</CsoundSynthesizer>
