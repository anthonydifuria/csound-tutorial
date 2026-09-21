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

            kGlissato linseg  400, 10, 1000 ; We generate a linear function that goes from the value 400 to the value 1000 in 10 seconds
            ;kGlissato is a "k" type variable, its sampling rate is set by kr 
            ;kr = sr / ksmps - since sr = 44100 and ksmps = 10, this variable has 4410 samples per second, so it is 10 times slower and less precise than an "a" variable
            ;which instead runs at a sampling rate = 44100
            ;IMPORTANT - we will use these variables for all controls that are slower than audio.
            ;VIOLINIST EXAMPLE - The sound of a violin note at 1000 hz varies between a maximum and a minimum 1000 times per second,
            ;while the performer cannot alternate the bow more than 20 times per second; in the first case we have "a" audio variables, in the second "k" control variables

            aSignal oscili 0.1, kGlissato ;kGlissato controls the oscillator frequency, going from 400 hz to 1000 hz in 10 seconds
            
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
