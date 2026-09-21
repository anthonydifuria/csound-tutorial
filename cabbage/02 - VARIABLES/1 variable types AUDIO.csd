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


            aSignal oscili 0.1, 400
            ;the "a" type variable is an audio variable, which means it is tied to the sampling rate
            ;we will use it for all audio streams (e.g. to listen to a sine wave, to listen to audio captured from outside, when we need more detailed control)
            ;let us remember that the (audio) sampling rate is the number of samples available per unit of time, and it is the maximum audio resolution we can have in a system

            outs aSignal, aSignal;we listen to the audio signal made of a sine wave with amplitude = 0.1 and frequency = 400hz

        endin

    </CsInstruments>
    
    <CsScore>
        ;causes Csound to run for about 7000 years...
        f0 z
        ;starts instrument 1 and runs it for a week
        i1 0 [60*60*24*7] 
    </CsScore>

</CsoundSynthesizer>
