<CsoundSynthesizer>

    <CsOptions>
        -n -d -+rtmidi=NULL -M0 
    </CsOptions>

    <CsInstruments>
; Converted from the Cabbage version for csound7~ (Pure Data / Max).
; Controls arrive from the patch as channels (chnget) with the same names as the Cabbage widgets.
        ;sr is set by the host
        ksmps = 16 
        nchnls = 2  
        0dbfs=1 

        instr 1 

        kMasterOut chnget "master" 

        aOutMaster oscili kMasterOut,300,  5;GAUSS WAVE (function - f5)
                                        ;function number
                                        ;by changing the number we can display the shape of the generated wave

        outs aOutMaster, aOutMaster

        display	aOutMaster, .1, 1 ;oscilloscope, signal display

        endin

    </CsInstruments>

    <CsScore>
        f0 z
        ;GEN FUNCTIONS TABLE
        ;f1(function 1) - 0 - 4096(table size 4096 samples) - 10(GEN type see manual) - 1(fundamental frequency of amplitude 1)
        ;next we can enter the amplitudes of the other partials of the harmonic series

        f1 0 4096 10 1 ;SINE
        f2 0 4096 10 1 0 [1/3] 0 [1/5] 0 [1/7] 0 [1/9] 0 [1/11] 0 [1/13] 0 [1/15] ;SQUARE WAVE
        f3 0 4096 10 1 [1/2] [1/3] [1/4] [1/5] [1/6] [1/7] [1/8] [1/9] [1/10] [1/11] [1/12] [1/13] [1/14] ;SAWTOOTH WAVE
        f4 0 4096 10 1 0 [1/3^2] 0 [1/5^2] 0 [1/7^2] 0 [1/9^2] 0 [1/11^2] 0 [1/13^2] 0 [1/15^2] ;TRIANGLE WAVE 

        f5 0 1025 20 2							; GAUSS BELL
        f6 0 1025  7 0 128 1 768 1 120 0 8 0		; TRAPEZOID

        ;instrument 1 starts at 0 and ends at [60*60*24*7]
        i1 0 [60*60*24*7] 
    </CsScore>

</CsoundSynthesizer>
