<CsoundSynthesizer>

    <CsOptions>
        -n -d  -+rtmidi=NULL -M0 --midi-key-cps=4 --midi-velocity-amp=5
    </CsOptions>                                ;p4                 p5

    <CsInstruments>
; Converted from the Cabbage version for csound7~ (Pure Data / Max).
; Controls arrive from the patch as channels (chnget) with the same names as the Cabbage widgets.
massign 0, 1 ; all MIDI channels -> instr 1 (the MIDI keyboard of the Cabbage version)
        ; Initialize the global variables. 
        ksmps = 10
        nchnls = 2
        0dbfs = 1

        giONDA init 1; initialized for the SINE wave
        gaOut init 0

        instr 2

            ;MASTER OUT
            gkOut chnget "out"

            ;ENVELOPE
            gkAtt chnget "att"
            gkDec chnget "dec"
            gkSus chnget "sus"
            gkRel chnget "rel"

            ;WAVE TYPES
            gkONDE chnget "onde"

            gkTrig chnget "trigger"
            kout trigger gkTrig, 0.5 ,2

            if(kout > 0.5)then
                event "i", 10, 0, 0.1;CALLS INSTRUMENT 10 to change the wave type
            else
            endif

        endin


        instr 1

            ;from the virtual keyboard
            kAmp = p5
            kFreq = p4 

            ;ADDITIVE SYNTHESIS OSCILLATOR WITH GEN FUNCTIONS (see in the score)
            aSig oscili kAmp, kFreq, giONDA

            ;ENVELOPE
            iAtt = i(gkAtt)
            iDec = i(gkDec)
            iSus = i(gkSus)
            iRel = i(gkRel)
            aEnv madsr iAtt, iDec, iSus, iRel

            ;ENVELOPE APPLICATION
            aSigEnv = aSig * aEnv

            ;OUTPUT TO INSTRUMENT 50
            ;accumulation of the global variable to have a constant signal
            ;otherwise we will hear a truncation of the signal  - SIGNAL TRUNCATION EXAMPLE
            gaOut = gaOut + aSigEnv 

        endin


        instr 50; OUTPUTS

            aSigEnv = gaOut

            aOut = aSigEnv * gkOut; multiply by the gkOut control to adjust the amplitude

            outs aOut, aOut

            display	aOut, .1, 1 ;oscilloscope, signal display

            gaOut = 0

        endin


        instr 10

            if( i(gkONDE) == 1 ) then

            giONDA = 1

            elseif ( i(gkONDE) == 2 ) then

            giONDA = 2

            elseif ( i(gkONDE) == 3 ) then

            giONDA = 3

            elseif ( i(gkONDE) == 4 ) then

            giONDA = 4

            endif

        endin

    </CsInstruments>

    <CsScore>
        ;causes Csound to run for about 7000 years...
        f0 z
        f1 0 4096 10 1 ;SINE
        f2 0 4096 10 1 0 [1/3] 0 [1/5] 0 [1/7] 0 [1/9] 0 [1/11] 0 [1/13] 0 [1/15] ;SQUARE WAVE
        f3 0 4096 10 1 [1/2] [1/3] [1/4] [1/5] [1/6] [1/7] [1/8] [1/9] [1/10] [1/11] [1/12] [1/13] [1/14] ;SAWTOOTH WAVE
        f4 0 4096 10 1 0 [1/3^2] 0 [1/5^2] 0 [1/7^2] 0 [1/9^2] 0 [1/11^2] 0 [1/13^2] 0 [1/15^2] ;TRIANGLE WAVE 


        i2 0 [60*60*24*7]; instrument 2 always on for 1 week
        i50 0 [60*60*24*7]
    </CsScore>

</CsoundSynthesizer>
