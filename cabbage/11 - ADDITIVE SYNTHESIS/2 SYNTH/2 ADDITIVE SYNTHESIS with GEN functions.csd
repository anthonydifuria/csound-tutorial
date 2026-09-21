<Cabbage>

    form caption("2 ADDITIVE SYNTHESIS GEN FUNCTIONS") size(700, 500), guiMode("queue"), pluginId("def1") , colour(110, 110, 110)
    keyboard bounds(10, 392, 682, 95)
    signaldisplay bounds(322, 86, 362, 187), colour("white") displayType("waveform"), backgroundColour(0, 0, 0), zoom(0.5), signalVariable("aOut", "aOut"), channel("display")


    ;OUTPUT AMPLITUDE
    rslider bounds(614, 312, 60, 60) channel("out") range(0, 1, 0.5, 1, 0.001)     text("Amplitude")
                                                    
    ;ENVELOPE CONTROLS                                               
    rslider bounds(434, 10, 60, 60) channel("att") range(0.001, 1, 0.1, 1, 0.001)  text("ATT")
    rslider bounds(494, 10, 60, 60) channel("dec") range(0.001, 1, 0.1, 1, 0.001)  text("DEC")
    rslider bounds(554, 10, 60, 60) channel("sus") range(0, 1, 0.5, 1, 0.001)     text("SUS")
    rslider bounds(624, 10, 60, 60) channel("rel") range(0.001, 1, 0.3, 1, 0.001) text("REL")

    ;WAVE TYPES
    button bounds(272, 314, 80, 40) channel("trigger"), text("CHANGE"), corners(5)
    combobox bounds(354, 314, 199, 40) channel("onde") colour:0(147, 210, 0), corners(5), items("SINE","SQUARE","SAW", "TRIANGLE")

</Cabbage> 


<CsoundSynthesizer>

    <CsOptions>
        -n -d --displays -+rtmidi=NULL -M0 --midi-key-cps=4 --midi-velocity-amp=5
    </CsOptions>                                ;p4                 p5

    <CsInstruments>
        ; Initialize the global variables. 
        ksmps = 10
        nchnls = 2
        0dbfs = 1

        giONDA init 1; initialized for the SINE wave
        gaOut init 0

        instr 2

            ;MASTER OUT
            gkOut cabbageGetValue "out"

            ;ENVELOPE
            gkAtt cabbageGetValue "att"
            gkDec cabbageGetValue "dec"
            gkSus cabbageGetValue "sus"
            gkRel cabbageGetValue "rel"

            ;WAVE TYPES
            gkONDE cabbageGetValue "onde"

            gkTrig cabbageGetValue "trigger"
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
