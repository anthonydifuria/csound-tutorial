<CsoundSynthesizer>

<CsOptions>
 -n -d -+rtmidi=NULL -M0 -m0d 
</CsOptions>

<CsInstruments>
; Converted from the Cabbage version for csound7~ (Pure Data / Max).
; Controls arrive from the patch as channels (chnget) with the same names as the Cabbage widgets.
    ;Initialize the global variables. 

    ;sr is the variable that initializes the sampling rate; in the case of Cabbage it takes sr directly from the software,
    ;just click on the wrench and screwdriver symbol at the top
    ;sr = 44100
    ;kr = 4410
    ksmps = 10 ;indicates the ratio between the sampling rate and the control rate
    ;if ksmps = 10 it means there are 10 times fewer control samples than the sampling rate
    nchnls = 2; indicates the number of audio channels we can use in our code (input and output)
    0dbfs = 1; amplitude normalization between 0 and 1 (0: no sound - 1: maximum amplitude)


    instr 1

        ;example
        iSampleRate = 44100 
        iControlRate = 4410

        iKSMPS = iSampleRate / iControlRate

        print iKSMPS ;print iKSMPS in the console below

    endin

</CsInstruments>

<CsScore>
    ;causes Csound to run for about 7000 years...
    f0 z
    ;starts instrument 1 and runs it for a week
    i1 0 [60*60*24*7] 
</CsScore>

</CsoundSynthesizer>
