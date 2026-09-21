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

        ;VERY IMPORTANT: HOW TO WRITE A VARIABLE CORRECTLY
        ; e.g. INSTANTANEOUS iVARIABLENAME  -  iFrequenza or iAmpiezza or iGiovanni - the variable name must always be preceded by the lowercase letter "i"
        ; e.g. CONTROL kVARIABLENAME  -  kFrequenza or kAmpiezza or kGiovanni - the variable name must always be preceded by the lowercase letter "k"
        ; e.g. AUDIO aVARIABLENAME  -  aFrequenza or aAmpiezza or aGiovanni - the variable name must always be preceded by the lowercase letter "a"
        ; e.g. GLOBAL INSTANTANEOUS giVARIABLENAME  -  giFrequenza or giAmpiezza or giGiovanni - the variable name must always be preceded by the lowercase letters "gi"
        ; e.g. GLOBAL CONTROL gkVARIABLENAME  -  gkFrequenza or gkAmpiezza or gkGiovanni - the variable name must always be preceded by the lowercase letters "gk"
        ; e.g. GLOBAL AUDIO gaVARIABLENAME  -  gaFrequenza or gaAmpiezza or gaGiovanni - the variable name must always be preceded by the lowercase letters "ga"
        instr 1

        iCOSTANTE = 100; "i" type variable
        print iCOSTANTE

        kCONTROLLO = 200; "k" type variable
        printk 2, kCONTROLLO

        giFrequenza = 400; "g" type variable, instantaneous
        gkFrequenza = 800; "g" type variable, control

        endin

        instr 2

        ;aSignal1 and aSignal2 "a" type variables
        aSignal1 oscili 0.1, giFrequenza

        aSignal2 oscili 0.1, gkFrequenza

        gaOut = (aSignal1 + aSignal2) / 2; gaOut -> "g" type audio variable 

        endin


        instr 3

        outs gaOut, gaOut; "g" type audio variable

        gaOut = 0 ;to avoid the accumulation of the audio stream (WE WILL SEE THIS LATER)

        endin

    </CsInstruments>

    <CsScore>
        ;causes Csound to run for about 7000 years...
        f0 z

        i1 0 [60*60*24*7] ;turns on instrument 1
        i2 0 [60*60*24*7] ;turns on instrument 2
        i3 0 [60*60*24*7] ;turns on instrument 3
    </CsScore>

</CsoundSynthesizer>
