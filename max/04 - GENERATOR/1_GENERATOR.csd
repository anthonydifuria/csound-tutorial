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

    instr GUI; instrument for the graphical interface, always on (see in the score)

        gkDur chnget "dur";duration of each sound event
        gkDen chnget "den";density - sound events / second

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
