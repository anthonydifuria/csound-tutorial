<Cabbage> bounds(0, 0, 0, 0)
    form caption("SAMPLE GRANULATOR FILTER") size(850, 700), pluginId("def1"), colour("40,40,40,255")
    ;keyboard bounds(8, 158, 381, 95)

    ;load file and set play/stop
    filebutton bounds(12, 12, 80, 25), text("Open File", "Open File"),  channel("filename"), shape("ellipse")
    checkbox   bounds(8, 40, 95, 25), channel("onoff"), text("ON/OFF"), , fontColour:0(255, 255, 255, 255)
    rslider bounds(176, 6, 63, 60), channel("ratePlay"), range(0, 2, 1, 1, 0.001), text("RATE PLAY")
    checkbox   bounds(158, 68, 95, 25), channel("PlayStop"), text("Play/Stop"), , fontColour:0(255, 255, 255, 255)
    ;WAVEFORM
    soundfiler bounds(4, 96, 843, 142), channel("beg","len"), identChannel("filer1"), colour(0, 255, 255, 255), fontColour(160, 160, 160, 255)

    ;FILE DATA
    label bounds(302, 8, 176, 20) channel("1") text("NUMBER OF CHANNELS")
    nslider bounds(480, 8, 100, 20) channel("nch") range(0, 1e+09, 0, 1, 0.0001)
    label bounds(302, 28, 176, 20) channel("2") text("DURATION")
    nslider bounds(480, 28, 100, 20) channel("durata") range(0, 1e+09, 0, 1, 0.0001)
    label bounds(302, 48, 176, 20) channel("3") text("PHASE FREQ")
    nslider bounds(480, 48, 100, 20) channel("phasefreq") range(0, 1e+09, 0, 1, 0.0001)
    label bounds(302, 68, 176, 20) channel("4") text("TABLE LENGTH")
    nslider bounds(480, 68, 100, 20) channel("lungtab") range(0, 1e+09, 0, 1, 1)

    ;GRANULATOR CONTROLS
    label bounds(600, 18, 72, 20) channel("5") text("POS ms")
    nslider bounds(602, 44, 69, 23) channel("posPhase") range(0, 1e+09, 0, 1, 1)
    rslider bounds(719, 18, 95, 70) channel("spreadPos") range(0, 1, 0, 1, 0.001) text("Spread Position")

    ;Duration and Density
    rslider bounds(8, 246, 59, 60), channel("dur"), range(2, 1000, 200, 1, 1), text("DUR")
    rslider bounds(148, 246, 59, 60), channel("den"), range(1, 100, 1, 1, 0.01), text("DEN")
    rslider bounds(72, 246, 59, 60) channel("durRand") range(0, 1, 0, 1, 0.001) text("RAND DUR")
    rslider bounds(214, 246, 59, 60) channel("densRand") range(0, 1, 0, 1, 0.001) text("RAND DENS")

    ;FUNDAMENTAL FREQUENCY AND ENVELOPE FUNCTIONS
    rslider bounds(292, 246, 69, 60), channel("detune"), range(0.125, 1, 1, 1, 0.001), text("TUNE")
    rslider bounds(374, 246, 69, 60), channel("spreadTune"), range(0, 1, 0, 1, 0.001), text("SPREADTUNE")
    label bounds(454, 256, 102, 18) channel("label10025") text("ENVELOPE")
    combobox bounds(454, 278, 102, 20) channel("func"), text("Hanning", "Bartlett (Triangle)", "Gaussian")

    ;SERIES
    rslider bounds(6, 330, 60, 60) channel("harm") range(1, 5, 0, 1, 1) text("HARM")

    ;PAN
    rslider bounds(560, 242, 95, 70) channel("spreadpan") range(0, 1, 0, 1, 0.001) text("Spread Pan")

    ;RESON EFFECT
    rslider bounds(600, 336, 60, 60) channel("ampFilt") range(0, 1, 0.5, 1, 0.001) text("ampFilt")
    rslider bounds(662, 336, 60, 60) channel("FreqFilt") range(20, 2000, 200, 1, 0.001) text("FreqFilt")
    rslider bounds(724, 336, 60, 60) channel("CutOff") range(100, 10000, 10000, 1, 0.001) text("CutOff")
    rslider bounds(786, 336, 60, 60) channel("Feedback") range(0, 0.999, 0.8, 1, 0.001) text("Feedback")

    ;REVERBERATION
    rslider bounds(662, 246, 60, 60) channel("rev") range(0, 1, 0, 1, 0.001) text("REVERB")
    rslider bounds(724, 246, 60, 60) channel("room") range(0, 0.999, 0, 1, 0.001) text("ROOM")

    ;OUTPUT
    rslider bounds(786, 246, 60, 60), channel("out"), range(0, 1, 0.25, 1, 0.01), text("OUTPUT")


</Cabbage>

<CsoundSynthesizer>

    <CsOptions>
    -n -d -+rtmidi=NULL -M0 -m0d --midi-key-cps=4 --midi-velocity-amp=5
    </CsOptions>

    <CsInstruments>
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
        gSfilepath  cabbageGetValue "filename" 

        ;ON OFF and PLAY STOP
        gkOnOff     cabbageGetValue "onoff"    
        gkPlayStop  cabbageGetValue "PlayStop"   
        gkRatePlay  cabbageGetValue "ratePlay"

        ;POSITION and POSITION RANDOMIZATION
        gkBeg     cabbageGetValue "beg"
        gkEnd    cabbageGetValue "len"
        gkSpreadPos cabbageGetValue "spreadPos"

        ;DURATION AND DENSITY
        gkDur0      cabbageGetValue "dur"
        gkDur = gkDur0 * 0.001
        gkDurRand   cabbageGetValue "durRand"
        gkDen       cabbageGetValue "den"
        gkDenRand   cabbageGetValue "densRand"

        ;DETUNING
        gkDetune    cabbageGetValue "detune"
        gkHarm      cabbageGetValue "harm"
        gkSprdTune  cabbageGetValue "spreadTune"
    
        ;RESON EFFECT
        gkAmpFilt  cabbageGetValue "ampFilt"
        gkFreqFilt  cabbageGetValue "FreqFilt"
        gkCutOff  cabbageGetValue "CutOff"
        gkFeedback  cabbageGetValue "Feedback"
    
        ;OUTPUTS
        gkSpreadPan cabbageGetValue "spreadpan"

        gkSINE      cabbageGetValue "sine"

        gkRoom      cabbageGetValue "room"
        gkRev       cabbageGetValue "rev"
        gkOut       cabbageGetValue "out"


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
        cabbageSetValue "nch", gichans
 
        ; WRITES THE FILE INTO A MONO or STEREO TABLE
        gitableL    ftgen    1,0,0,1,gSfilepath,0,0,1
        if gichans==2 then
        gitableR    ftgen    2,0,0,1,gSfilepath,0,0,2
        endif
 
        ; TABLE LENGTH         
        gifilelen = nsamp(gitableL)
        cabbageSetValue "lungtab", gifilelen
 
        ; TABLE DURATION IN SECONDS	
        giDurata = gifilelen / sr
        cabbageSetValue "durata", giDurata
  
        ; NOT USED - represents the sample advance rate
        giphasfreq	= sr / (ftlen(gitableL))
        cabbageSetValue "phasefreq", giphasfreq
 
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
        cabbageSetValue "posPhase", kPhaseMS + kPlayMS + kSpreadPosMS;display of the position in milliseconds

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
        aenv poscil3 1, 1/i(gkDurSum), giFunc[cabbageGetValue:i("func")-1] //ask the prof

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
