<Cabbage>

    form caption("Untitled") size(400, 300), guiMode("queue") pluginId("def1")
    rslider bounds(296, 162, 100, 100), channel("gain"), range(0, 1, 0, 1, .01), text("Gain"), trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")

</Cabbage>

<CsoundSynthesizer>

    <CsOptions>
        -n -d -+rtmidi=NULL -M0 -m0d 
    </CsOptions>

    <CsInstruments>
        ; Initialize the global variables. 
        ksmps = 800
        nchnls = 2
        0dbfs = 1


        instr 1

            ;OPCODE: Operation code (these are the fundamental functions of csound that allow us to build our audio or control algorithms)
            ;SEE CSOUND MANUAL at the top of the help

            ;the opcodes we will examine now are "oscili" and "outs"
            ;oscili will generate a sine wave at 400 hz and amplitude 0.1 and outs is the connection to the DAC so that we can hear the sound
            kSignal oscili 0.1, 400

            aSignal upsamp kSignal

            outs aSignal, aSignal ;"outs" stereo outputs

        endin

    </CsInstruments>

    <CsScore>
        ;causes Csound to run for about 7000 years...
        f0 z

        i1 0 [60*60*24*7] ;turns on instrument 1 for one week
    </CsScore>

</CsoundSynthesizer>
