<CsoundSynthesizer>

    <CsOptions>
    -n -d -+rtmidi=NULL -M0 -m0d --midi-key-cps=4 --midi-velocity-amp=5
    </CsOptions>

    <CsInstruments>
; Converted from the Cabbage version for csound7~ (Pure Data / Max).
; Controls arrive from the patch as channels (chnget) with the same names as the Cabbage widgets.
    ; Initialize the global variables. 
    ksmps = 32
    nchnls = 2
    0dbfs = 1

    ;----------GLOBAL VARIABLES INITIALIZATION-------------
    gichans     init    0
    giFileLen   init    0
    giReady     init    0
    gSfilepath  init    ""

    ;audio variables
    gaL init 0
    gaR init 0

    ;play variable
    gkPlay init 0
    giResetPlay init 0
    ;--------------------------------------------------------

    instr 1

        ;FILE PATH
        gSfilepath  chnget "filename" 

        ;ON OFF and PLAY STOP
        gkOnOff     chnget "onoff"    
        gkPlayStop  chnget "PlayStop"   
        gkRatePlay  chnget "ratePlay"

        ;POSITION and POSITION RANDOMIZATION
        gkBeg     chnget "beg"
        gkEnd    chnget "len"
        gkSpreadPos chnget "spreadPos"

        ;DURATION AND DENSITY
        gkDur0      chnget "dur"
        gkDur = gkDur0 * 0.001
        gkDurRand   chnget "durRand"
        gkDen       chnget "den"
        gkDenRand   chnget "densRand"

        ;DETUNING
        gkDetune    chnget "detune"
        gkHarm      chnget "harm"
        gkSprdTune  chnget "spreadTune"
    
        ;RESON EFFECT
        gkAmpFilt  chnget "ampFilt"
        gkFreqFilt  chnget "FreqFilt"
        gkCutOff  chnget "CutOff"
        gkFeedback  chnget "Feedback"
    
        ;OUTPUTS
        gkSpreadPan chnget "spreadpan"

        gkSINE      chnget "sine"

        gkRoom      chnget "room"
        gkRev       chnget "rev"
        gkOut       chnget "out"


        ;ARRAY OF ENVELOPE FUNCTIONS
        giFunc[] fillarray 3, 4, 6


        ; CALLS INSTRUMENT 99 to load the file 
        prints gSfilepath
        if changed:k(gSfilepath)==1 then       
        event "i",99,0,0
        endif
 
        ;TURNS ON/OFF - ON/OFF
        ktrig trigger gkOnOff,0.5,0 ;turns on schedkwhen, which calls instrument 2 with an 
                                          ;infinite duration (note -1 as the last argument of schedkwhen)
        schedkwhen ktrig,0,0,2,0,-1        ; start instrument 2
 
        ;PLAY/OFF
        ktrig2    trigger    gkPlayStop,0.5,0 
        schedkwhen    ktrig2,0,0,20,0,-1        

    endin


    instr 99  ;LOADS A FILE  

        ; COMPUTES THE NUMBER OF CHANNELS
        gichans    filenchnls    gSfilepath           
        outvalue "nch", gichans
 
        ; WRITES THE FILE INTO A MONO or STEREO TABLE
        gitableL    ftgen    1,0,0,1,gSfilepath,0,0,1
        if gichans==2 then
        gitableR    ftgen    2,0,0,1,gSfilepath,0,0,2
        endif
 
        ; TABLE LENGTH         
        gifilelen = nsamp(gitableL)
        outvalue "lungtab", gifilelen
 
        ; TABLE DURATION IN SECONDS	
        giDurata = gifilelen / sr
        outvalue "durata", giDurata
  
        ; NOT USED - represents the sample advance rate
        giphasfreq	= sr / (ftlen(gitableL))
        outvalue "phasefreq", giphasfreq
 
        ;DRAWS THE FILE WAVEFORM
        Smessage sprintfk "file(%s)", gSfilepath
        chnset Smessage, "filer1"   
 
    endin



    instr 2 ;INSTRUMENT with the initial controls that will call instrument 3

        if gkOnOff==0 then ;if gkPlayStop = 0 then it turns itself off, i.e. instrument 2
        turnoff
        endif
 
     ;---------DENS - DUR and INSTRUMENT 3 CALL-----------;
        ;DENS RAND and DUR RAND
        kDurRand random -1 * (gkDur * 0.5), (gkDur * 0.5)
        gkDurSum = gkDur + (kDurRand * gkDurRand)

        kDenRand randomh -gkDen * 0.5, gkDen * 0.5, 50
        gkDenSum = gkDen + (kDenRand * gkDenRand)

        ;OPCODE TO CALL INSTRUMENT 3
        kMetro = gkDenSum ;granulator density control
        ktrig metro kMetro ;metro sets the granulator density
        schedkwhen ktrig,0,0,3,0,gkDurSum  ;schedkwhen calls instrument 3
 
 
     ;---------------POSITION CONTROLS-------------------;
         ;SPREAD POS
        kSpreadPos0 randomh 0,1 * gkSpreadPos,gkDenSum 
 
        ;PHASE COMPUTATION FOR THE POSITION
        kPhase     = gkBeg ;(gifilelen * gkPhase)
        kPlay      = (gifilelen * gkPlay)
        kSpreadPos = (gifilelen * kSpreadPos0)
        gkPos = kPhase + kPlay + kSpreadPos ;POSITION
    
        ;PRINTS the position in milliseconds
        kPhaseMS     = (giDurata * (gkBeg / gifilelen)  * 1000)
        kPlayMS      = (giDurata * gkPlay * 1000)
        kSpreadPosMS = (giDurata * kSpreadPos0 * 1000)
        outvalue "posPhase", kPhaseMS + kPlayMS + kSpreadPosMS

        ;SCRUBBER - CURSOR ON THE WAVEFORM
        Smessage sprintfk "scrubberPosition(%d)", gkPos
        chnset Smessage, "filer1"
 
    endin


    ;PLAY/OFF INSTRUMENT
    instr 20
    
        if gkPlayStop==0 then 
        gkPlay = 0
        turnoff
        endif
       
        ;RESET PLAY
        kReset changed gkBeg
        if(kReset > 0)then
              gkPlay = 0
            endif   
       
        ;FWR PLAY
        gkPlay = gkPlay + ((ksmps) * gkRatePlay / gifilelen)

        if(gkEnd = 0)then
            if (gkPlay >= 1 - (gkBeg / gifilelen))then 
            gkPlay = 0
            endif
        else
            if (gkPlay >= gkEnd / gifilelen)then 
            gkPlay = 0
            endif
        endif


    endin


    instr 3 

        ;ENVELOPE
        aenv poscil3 1, 1/i(gkDurSum), giFunc[chnget:i("func")-1] //ask the prof

        ;FREQUENCY COMPUTATION
        iHarm = 1 + (int(rnd(i(gkHarm))))
        iSpreadTune = rnd(i(gkSprdTune))
        iFreq = (i(gkDetune) + (iSpreadTune * i(gkDetune))) * iHarm

        ;PHASE COMPUTATION
        iPhase = i(gkPos)
 
        ;AMPLITUDE COMPUTATION
        iAmp0 = (i(gkDurSum) * i(gkDenSum))
        if (iAmp0 >= 1) then
        iAmp = iAmp0
        elseif (iAmp0 < 1) then
        iAmp = 1
        endif

        iAmpTot = (1/iAmp) / iHarm

        ;SIGNAL
        if gichans==2 then
        aSigL lposcil iAmpTot, iFreq , 0, 0, gitableL,iPhase  ;oscillator that reads the sample
        aSigR lposcil iAmpTot, iFreq , 0, 0, gitableR,iPhase ;oscillator that reads the sample
        else
        aSigL lposcil iAmpTot, iFreq , 0, 0, gitableL,iPhase  ;oscillator that reads the sample
        aSigR lposcil iAmpTot, iFreq , 0, 0, gitableL,iPhase ;oscillator that reads the sample
        endif

        aSig = (aSigL + aSigR) / 2

        ;PANNING SPREAD
        irndPan = 0.5 + (((rnd(2) - 1) / 2) * i(gkSpreadPan))

        ;SOURCE PANNING
        aL,aR pan2 (aSig)  * aenv, irndPan

        ;SEND TO INSTRUMENT 50 - ORIGINAL SOUND
        gaL = aL + gaL
        gaR = aR + gaR 

    endin



    instr 50

        aL = gaL 
        aR = gaR
    
        ;RESON FILTER
        aLFilt wguide1 aL * gkAmpFilt, gkFreqFilt, gkCutOff, gkFeedback
        aRFilt wguide1 aR * gkAmpFilt, gkFreqFilt, gkCutOff, gkFeedback
    
        ;REVERB
        aSumREV_L = (aL) 
        aSumREV_R = (aR)

        aRevL, aRevR freeverb aSumREV_L + aLFilt, aSumREV_R + aRFilt, gkRoom, 0.5

        ;SUM OF OUTPUTS
        aSumL = (aL * gkOut) + (aRevL * gkRev) + aLFilt
        aSumR = (aR * gkOut) + (aRevR * gkRev) + aRFilt

        outs aSumL, aSumR 

        gaL = 0
        gaR = 0

    endin

    </CsInstruments>

    <CsScore>
        ;causes Csound to run for about 7000 years...
        f0 z

        f1 0 1024 10 1

        f2 0 1025 20 1 1; Hamming
        f3 0 1025 20 2 1; Hanning
        f4 0 1025 20 3 1; Bartlett
        f5 0 1025 20 7 1; Kaiser
        f6 0 1025 20 6 1; Gaussian

        ;f8 0 1025  7 0 128 1 768 1 120 0 8 0		; A trapezoid envelope
        ;f9 0 1025  16 0 24 2 1  1000 -5 0	; An Exp envelope  
        ;f10 0 1025  7 0 16 1 256 0.5 256 0.15 220 0 20 0 ; A dual decay envelope

        i1 0 3600000000
        i50 0 3600000000
    </CsScore>

</CsoundSynthesizer>
