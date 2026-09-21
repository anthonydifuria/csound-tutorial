<Cabbage> bounds(0, 0, 0, 0)
    form caption("GENERATOR 6") size(700, 400), guiMode("queue") pluginId("def1")
    rslider bounds(496, 296, 100, 100), channel("out"), range(0, 1, 0.25, 1, 0.01), text("OUTPUT"), trackerColour(0, 255, 0, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255)

    rslider bounds(10, 10, 100, 100), channel("dur"), range(0.01, 1, 0.5, 1, 0.01), text("DUR"), trackerColour(0, 255, 0, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255)
    rslider bounds(110, 10, 100, 100), channel("den"), range(1, 20, 1, 1, 0.01), text("DEN"), trackerColour(0, 255, 0, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255)

    ;fundamental frequency
    rslider bounds(210, 10, 100, 100), channel("ffond"), range(100, 1000, 200, 1, 0.01), text("FUND FREQ"), trackerColour(0, 255, 0, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255)
    rslider bounds(310, 10, 100, 100), channel("spredFreq"), range(0, 1000, 200, 1, 0.01), text("SPREAD FREQ"), trackerColour(0, 255, 0, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255)

</Cabbage>

<CsoundSynthesizer>

    <CsOptions>
        -n -d -+rtmidi=NULL -M0 -m0d 
    </CsOptions>

    <CsInstruments>
        ; Initialize the global variables. 
        ksmps = 32
        nchnls = 2
        0dbfs = 1

        instr GUI; instrument for the graphical interface, always on (see in the score)

        gkDur cabbageGetValue "dur";duration of each sound event
        gkDen cabbageGetValue "den";density - sound events / second

        gkFFond cabbageGetValue "ffond";fundamental frequency
        gkSpreadFreq cabbageGetValue "spredFreq";frequency spread - frequency interval between gkFFond and gkSpreadFreq

        endin

        instr 1

            ktrig metro gkDen;density - EVENTS PER SECOND     
            schedkwhen ktrig,0,0,2,0,gkDur ;calls / turns on instrument 2 with duration gkDur

        endin

        instr 2

            iSpreadFreq = rnd( i(gkSpreadFreq) );rnd is an operator that randomizes values between 0 and the value of gkSpreadFreq
                                                ;if gkSpreadFreq = 200 the random values will be generated between 0 and gkSpreadFreq

            iFFond = i(gkFFond);control the oscillator frequency
            aSig oscili 0.1, iFFond + iSpreadFreq;if the value of gkSpreadFreq = 200 the oscillator frequency will be controlled
                                                 ;randomly from the value of iFFond = 100 to the value of gkSpreadFreq

            aEnv linseg 0, i(gkDur)/2, 1, i(gkDur)/2, 0;envelope

            aSigEnv = aSig * aEnv ;apply the envelope to the sine signal 

            outs aSigEnv, aSigEnv

        endin

    </CsInstruments>

    <CsScore>
        ;causes Csound to run for about 7000 years...
        f0 z
        ;starts instrument 1 and runs it for a week
        i "GUI" 0 [60*60*24*7] 
        i1 0 [60*60*24*7] 
    </CsScore>

</CsoundSynthesizer>
