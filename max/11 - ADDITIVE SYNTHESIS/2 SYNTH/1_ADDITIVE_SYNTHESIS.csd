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

    gaOut init 0

    instr 2

        ;MASTER OUT
        gkOut chnget "out"

        ;ENVELOPE
        gkAtt chnget "att"
        gkDec chnget "dec"
        gkSus chnget "sus"
        gkRel chnget "rel"

        ;SINE AMPLITUDES
        gkA1 chnget "a1"
        gkA2 chnget "a2"
        gkA3 chnget "a3"
        gkA4 chnget "a4"
        gkA5 chnget "a5"

        gkONDE chnget "onde"

        gkTrig chnget "trigger"
        kout trigger gkTrig, 0.5 ,2

        if(kout > 0.5)then

            event "i", 10, 0, 0.1

        else
    endif

    endin

    instr 1

        ;from the virtual keyboard
        kAmp = p5
        kFreq = p4 

        ;ADDITIVE SYNTHESIS OSCILLATORS - HARMONIC SERIES
        aSig1 oscili kAmp * gkA1, kFreq * 1 ;FUNDAMENTAL 1F
        aSig2 oscili kAmp * gkA2, kFreq * 2 ;HARMONIC 2F
        aSig3 oscili kAmp * gkA3, kFreq * 3 ;HARMONIC 3F
        aSig4 oscili kAmp * gkA4, kFreq * 4 ;HARMONIC 4F
        aSig5 oscili kAmp * gkA5, kFreq * 5 ;HARMONIC 5F

        aSumSignal = (aSig1 + aSig2 + aSig3 + aSig4 + aSig5) / 5; sum the signals and divide by the number of signals
                                                                ; to avoid signal saturation

        ;ENVELOPE
        iAtt = i(gkAtt)
        iDec = i(gkDec)
        iSus = i(gkSus)
        iRel = i(gkRel)
        aEnv madsr iAtt, iDec, iSus, iRel


        ;ENVELOPE APPLICATION
        aSigEnv = aSumSignal * aEnv

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

        kOnda[] fillarray 1, 1, 1, 1, 1

        elseif ( i(gkONDE) == 2 ) then

        kOnda[] fillarray 1, 0, 1/3, 0, 1/5

        elseif ( i(gkONDE) == 3 ) then

        kOnda[] fillarray 1, 1/2, 1/3, 1/4, 1/5

        elseif ( i(gkONDE) == 4 ) then

        kOnda[] fillarray 1, 0, 1/3^2, 0, 1/5^2

        endif

        if metro(20) == 1 then
            outvalue "a1", kOnda[0]
        endif
        if metro(20) == 1 then
            outvalue "a2", kOnda[1]
        endif
        if metro(20) == 1 then
            outvalue "a3", kOnda[2]
        endif
        if metro(20) == 1 then
            outvalue "a4", kOnda[3]
        endif
        if metro(20) == 1 then
            outvalue "a5", kOnda[4]
        endif

    endin

    </CsInstruments>

    <CsScore>
        ;causes Csound to run for about 7000 years...
        f0 z

        i2 0 [60*60*24*7]; instrument 2 always on for 1 week
        i50 0 [60*60*24*7]
    </CsScore>

</CsoundSynthesizer>
