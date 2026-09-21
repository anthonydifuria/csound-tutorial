<Cabbage>
form caption("GENERATOR 3") size(700, 400), guiMode("queue") pluginId("def1")
rslider bounds(496, 296, 100, 100), channel("out"), range(0, 1, 0.25, 1, 0.01), text("OUTPUT"), trackerColour(0, 255, 0, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255)

rslider bounds(10, 10, 100, 100), channel("dur"), range(0.01, 1, 0.5, 1, 0.01), text("DUR"), trackerColour(0, 255, 0, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255)
rslider bounds(110, 10, 100, 100), channel("den"), range(1, 20, 1, 1, 0.01), text("DEN"), trackerColour(0, 255, 0, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255)

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

        giStrumento2 init 0; initialize the counter variable of instrument 2

        instr GUI; instrument for the graphical interface, always on (see in the score)

            gkDur cabbageGetValue "dur";duration of each sound event
            gkDen cabbageGetValue "den";density - sound events / second

        endin

        instr 1
                    
            ktrig metro gkDen;density - EVENTS PER SECOND
                
            ;the schedkwhen OPCODE has the task of turning on instrument number 2 and
            ;keeps it on for the duration gkDur in seconds - so if gkDur = 1, instrument
            ;number 2 will stay on for 1 second, if gkDur = 0.5 it will stay on for half a second or 500 milliseconds
            schedkwhen ktrig,0,0,2,0,gkDur 
            ;ktrig -> density - how many times per second instrument 2 must be turned on
            ;0,0 -> for now we do not take them into account
            ;,2 -> instrument to turn on
            ;,gkDur -> how long it must stay on

        endin

        ;the initial values of Duration and Density are the following
        ;gkDen = 1
        ;dkDur = 0.5
        ;so instrument number 2 will turn on once per second and will last 500 milliseconds or 0.5 seconds
        instr 2

            ;below is an example with an oscillator
            aSig oscili 0.1, 440
            outs aSig, aSig

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
