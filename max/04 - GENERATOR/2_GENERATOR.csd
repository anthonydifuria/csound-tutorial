<CsoundSynthesizer>

    <CsOptions>
    -n -d -+rtmidi=NULL -M0 -m0d 
    </CsOptions>

    <CsInstruments>
; Converted from the Cabbage version for csound7~ (Pure Data / Max).
; Controls arrive from the patch as channels (chnget) with the same names as the Cabbage widgets.
        ; Initialize the global variables. 
        ksmps = 32
        nchnls = 2
        0dbfs = 1

        giStrumento2 init 0; initialize the counter variable of instrument 2

        instr GUI; instrument for the graphical interface, always on (see in the score)
                    
            gkDur chnget "dur";duration of each sound event
            gkDen chnget "den";density - sound events / second

        endin

        instr 1

            ktrig metro gkDen;density - EVENTS PER SECOND
            schedkwhen ktrig,0,0,2,0,gkDur ;turns on instrument 2 - In detail SEE 3_GENERATOR.csd

        endin

        instr 2

            ;will print the counter value initialized to 0 
            ;and then will print the values indefinitely (see in console) 
            ; see counter giStrumento2 = giStrumento2 + 1
            print giStrumento2
            ;instr 2:  giStrumento2 = 0.000
            ;instr 2:  giStrumento2 = 1.000
            ;instr 2:  giStrumento2 = 2.000
            ;instr 2:  giStrumento2 = 3.000.........

            ;Counter from 1 to infinity 
            ;increases by one every time instrument 2 is called
            giStrumento2 = giStrumento2 + 1

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
