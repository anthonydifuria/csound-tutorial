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


    instr 1

        iFrequenza = 200

        print ifrequenza

        ;error:  Variable 'ifrequenza' used before defined
        ;Line 21
        ;Csound is telling us that the variable ifrequenza was not defined before being used,
        ;this is because ifrequenza has a lowercase f, so the language recognizes it as a different variable
        ;to solve the problem the two variables must have the same name as shown below

        ;PROBLEM SOLUTION
        ;iFrequenza = 200

        ;print iFrequenza

    endin

</CsInstruments>

<CsScore>
    ;causes Csound to run for about 7000 years...
    f0 z
    ;starts instrument 1 and runs it for a week
    i1 0 [60*60*24*7] 
</CsScore>

</CsoundSynthesizer>
