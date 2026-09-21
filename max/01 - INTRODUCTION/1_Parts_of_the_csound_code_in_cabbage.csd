;END OF GRAPHICAL INTERFACE

<CsoundSynthesizer>; THIS IS WHERE OUR SYNTHESIZER STARTS and it ends at </CsoundSynthesizer>

<CsOptions>;HERE WE WILL PUT OUR BASIC OPTIONS
 -n -d -+rtmidi=NULL -M0 -m0d 
</CsOptions>

<CsInstruments>; FROM HERE to </CsInstruments> we write the code to build our instruments
   
    ;Initialize the global variables. 
    ksmps = 10
    nchnls = 2
    0dbfs = 1


    instr 1

        prints "GIORGIO"
        iAmp = 1
        print iAmp
        kAmp = 1
        printk 1, kAmp
    
    endin

</CsInstruments>

<CsScore>; FROM HERE to </CsScore> we will write our score to turn on our instruments
    ;causes Csound to run for about 7000 years...
    f0 z
    ;starts instrument 1 and runs it for a week
    i1 0 [60*60*24*7] 
</CsScore>

</CsoundSynthesizer>
