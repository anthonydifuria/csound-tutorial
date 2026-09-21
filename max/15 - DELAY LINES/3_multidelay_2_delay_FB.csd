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
    
            kDry chnget "dry";dry
            kDly1Wet chnget "dly1";wet delay 1
            kDly2Wet chnget "dly2";wet delay 2

            kTimeDelay0  chnget "time1" ;delay time in ms
            kTimeDelayPort portk kTimeDelay0, 0.1 ;value porting
            aTimeDelay interp kTimeDelayPort ;interpolation

            kTimeDelay02  chnget "time2" ;delay time in ms
            kTimeDelayPort2 portk kTimeDelay02, 0.1 ;value porting
            aTimeDelay2 interp kTimeDelayPort2 ;interpolation

            kFeedBack  chnget "feedback" ;feedback

            aFeedBackL init 0 ; init feedback Left
            aFeedBackR init 0 ; init feedback Right
            aFeedBack2L init 0 ; init feedback 2 Left
            aFeedBack2R init 0 ; init feedback 2 Right

            aL inch 1 ;left
            aR inch 2 ;right

            ;Delay Serial Processing
            aDelayL  vdelay aL + (aFeedBackL * kFeedBack), aTimeDelay, 2000 
            aDelayR  vdelay aR + (aFeedBackR * kFeedBack), aTimeDelay, 2000

            aFeedBackL = aDelayL
            aFeedBackR = aDelayR 

            aDelay2L  vdelay aDelayL + (aFeedBack2L * kFeedBack), aTimeDelay2, 2000 
            aDelay2R  vdelay aDelayR + (aFeedBack2R * kFeedBack), aTimeDelay2, 2000 

            aFeedBack2L = aDelay2L
            aFeedBack2R = aDelay2R

            aOutL =  (aL * kDry) + (aDelayL * kDly1Wet) + (aDelay2L * kDly2Wet)
            aOutR =  (aR * kDry) + (aDelayR * kDly1Wet) + (aDelay2R * kDly2Wet)
     
            outs aOutL, aOutR

        endin

    </CsInstruments>
    
    <CsScore>
        ;causes Csound to run for about 7000 years...
        f0 z
        ;starts instrument 1 and runs it for a week
        i1 0 [60*60*24*7] 
    </CsScore>
    
</CsoundSynthesizer>
