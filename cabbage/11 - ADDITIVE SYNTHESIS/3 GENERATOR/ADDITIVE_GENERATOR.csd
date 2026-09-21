<Cabbage>
    form caption("ADDITIVE GENERATOR") size(700, 400), guiMode("queue") pluginId("def1")
    rslider bounds(496, 296, 100, 100), channel("out"), range(0, 1, 0.25, 1, 0.01), text("OUTPUT"), trackerColour(0, 255, 0, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255)

    rslider bounds(10, 10, 100, 100), channel("dur"), range(0.01, 1, 0.01, 1, 0.01), text("DUR"), trackerColour(0, 255, 0, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255)
    rslider bounds(110, 10, 100, 100), channel("den"), range(1, 100, 1, 1, 0.01), text("DEN"), trackerColour(0, 255, 0, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255)
    rslider bounds(220, 10, 100, 100), channel("ffond"), range(20, 1000, 300, 1, 0.01), text("FUND FREQ"), trackerColour(0, 255, 0, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255)
    rslider bounds(330, 10, 100, 100), channel("spreadfreq"), range(0, 400, 0, 1, 0.01), text("SPREAD FREQ"), trackerColour(0, 255, 0, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255)
    rslider bounds(440, 10, 100, 100), channel("harm"), range(1, 10, 1, 1, 0.01), text("HARMONICS"), trackerColour(0, 255, 0, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255)
    rslider bounds(550, 10, 100, 100), channel("spreadpan"), range(0, 1, 0, 1, 0.01), text("SPREAD PAN"), trackerColour(0, 255, 0, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255)


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

        gkrnd init 1
        gaL init 0
        gaR init 0

        instr 1

        ;controls
        gkDur cabbageGetValue "dur"
        gkDen cabbageGetValue "den"
        gkFfond cabbageGetValue "ffond"
        gkSpreadFreq cabbageGetValue "spreadfreq"
        gkHarm cabbageGetValue "harm"
        gkSpreadPan cabbageGetValue "spreadpan"
        gkOut cabbageGetValue "out"

        ;instrument 2 call
        ktrig metro  gkDen;density
					
        schedkwhen ktrig,0,0,2,0,gkDur ;calls instrument 2 with density gkDen and duration gkDur	

        endin


        instr 2

        ;Gaussian envelope
        aenv poscil3 1, 1/i(gkDur), 2 

        ;ADDITIVE

        ;Harmonics
        irndHarm = int(rnd(i(gkHarm)))+1 

        ;frequency spread
        irndSpredFreq = rnd(i(gkSpreadFreq)) - (i(gkSpreadFreq) / 2)

        ;oscillator
        iAmp = (1/i(gkDen))*(i(gkDen)/2) ;computes the amplitude with respect to the duration and density of the sound events
        iFreq = (i(gkFfond) * irndHarm)  + irndSpredFreq ;computes the frequency
        aSig oscili iAmp, iFreq; oscillator

        ; panning spread
        irndPan = 0.5 + (((rnd(2) - 1) / 2) * i(gkSpreadPan))

        ; panning
        aL,aR pan2 aSig * aenv, irndPan

        ; output to instrument 50
        gaL = aL + gaL
        gaR = aR + gaR

        endin


        instr 50

        aL = gaL * gkOut
        aR = gaR * gkOut

        outs aL,aR

        gaL = 0
        gaR = 0

        endin

    </CsInstruments>
    
    <CsScore>
        ;causes Csound to run for about 7000 years...
        f0 z

        f1 0 1024 10 1

        f2 0 1025 20 2							; A Gauss bell envelope
        f3 0 1025  7 0 128 1 768 1 120 0 8 0		; A trapezoid envelope
        f4 0 1025  16 0 24 2 1  1000 -5 0	; An Exp envelope  

        ;starts instrument 1 and runs it for a week
        i1 0 [60*60*24*7] 

        i50 0 [60*60*24*7] 
    </CsScore>
    
</CsoundSynthesizer>
