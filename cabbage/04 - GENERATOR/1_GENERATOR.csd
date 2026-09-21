<Cabbage>
form caption("GENERATOR 1") size(700, 400), guiMode("queue") pluginId("def1")
rslider bounds(496, 296, 100, 100), channel("out"), range(0, 1, 0.25, 1, 0.01), text("OUTPUT"), trackerColour(0, 255, 0, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255)

rslider bounds(10, 10, 100, 100), channel("dur"), range(0.01, 1, , 1, 0.01), text("DUR"), trackerColour(0, 255, 0, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255)
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

    instr GUI; instrument for the graphical interface, always on (see in the score)

        gkDur cabbageGetValue "dur";duration of each sound event
        gkDen cabbageGetValue "den";density - sound events / second

    endin

    instr 1

        ; the metro OPCODE generates a trigger (see in console) as many times as gkDen
        ;e.g. if gkDen = 1, it generates one trigger per second, if gkDen = 2 it generates 2 triggers per second 
        ktrig metro gkDen;density

        printk2 ktrig
        ;CONSOLE
        ;i1     0.00000
        ;i1     1.00000
            
        schedkwhen ktrig,0,0,2,0,gkDur ;SEE 3_GENERATOR              

    endin


    instr 2

    endin

    </CsInstruments>

    <CsScore>
        ;causes Csound to run for about 7000 years...
        f0 z

        ;starts instrument 1 and runs it for a week
        i "GUI" 0 [60*60*24*7] 
        i1 0 [60*60*24*7] 

        i50 0 [60*60*24*7] 
    </CsScore>

</CsoundSynthesizer>
