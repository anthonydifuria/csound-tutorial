# Pure Data / plugdata version

The Pd patches run the same Csound code as the Cabbage version through **`csound7~`**, a Pure Data / plugdata external that embeds Csound 7 (statically linked, no separate Csound install needed).

## Before you start: get the external

The patches will not work without `csound7~`. It is **not** included in this repository. Get it from:

- <https://github.com/anthonydifuria/csound7-pd>

Download the file for your system (`csound7~.pd_darwin` for macOS, `csound7~.pd_linux` for Linux, `csound7~.dll` for Windows) from the *Releases* page of that repository, or build it yourself by following its `README.md`.

Then put it where Pd/plugdata can find it: next to the patches, or in a folder listed in Pd's search path (*Preferences > Path*). On Apple Silicon you may also need `codesign --force --deep -s - csound7~.pd_darwin`.

For the message protocol and details, see the [`csound7~` manual](https://github.com/anthonydifuria/csound7-pd/blob/main/MANUAL.md).

## How the lessons are organised

`pd/` mirrors [`cabbage/`](../cabbage): one folder per lesson, and for every Cabbage example one `.csd` + one `.pd` patch with the same name (spaces in file names became `_`, because `csound7~` takes the file name as an object argument). The `.csd` is the Cabbage code with the `<Cabbage>` block removed: every widget is now a control in the patch that sends `<channel> <value>` to `csound7~`, and the code reads it with `chnget` (in Cabbage it was `cabbageGetValue`).

1. Copy `csound7~` where Pd can find it (see above) and open a `.pd` file.
2. Click **`; pd dsp 1`** (audio on). Sliders, toggles, buttons and menus talk to Csound; the keyboard examples take a MIDI keyboard through `notein`, or you can click the two test messages.
3. Examples that play a sound file (lessons 18, 20, 21) have an **open file** bang: click it, pick a file from the [`audio/`](../audio) folder, then click **start** (and **stop** when you are done). The granulator examples (lesson 14) have their own *open file* bang.
4. Examples that use live input (lessons 10 and 15) have an `adc~` connected: use headphones.

Notes:

- The `.csd` must stay next to its `.pd`.
- Values that Csound sends back to the interface (`outvalue`) are shown in number boxes or moved on the sliders.
- The waveform displays of lessons 5 and 11 are drawn from the left output channel.
- A few lessons only print in the Pd console (variables, arrays, UDO): open the console window to see the output.
- `csound7~` forces the host sample rate: examples about sample rate (lesson 6) behave according to Pd's current rate.
