# CSOUND_TUTORIAL

A step-by-step tutorial on sound synthesis and audio processing with [Csound](https://csound.com), from the first oscillator to FFT and phase vocoder. Every lesson is a set of small, commented, self-contained examples, each with its own graphical interface.

The tutorial is written for **Cabbage 2.9**. The same lessons are also available for **Pure Data** and **Max**, running Csound 7 through the `csound7~` externals.

## Repository structure

| Folder | Content |
| --- | --- |
| [`cabbage/`](cabbage) | The tutorial in Csound + Cabbage 2.9 (22 numbered lessons) |
| [`pd/`](pd) | Pure Data / plugdata version, same lessons and folders. Requires the [`csound7~`](https://github.com/anthonydifuria/csound7-pd) external |
| [`max/`](max) | Max version, same lessons and folders. Requires the [`csound7~`](https://github.com/anthonydifuria/csound7-max) external |
| [`audio/`](audio) | Sound files used by the examples, shared by all versions |

## Contents of the tutorial

1. Introduction
2. Variables
3. Opcodes and first synthesizer
4. Generator
5. GEN functions
6. Sampling and quantization
7. Digital oscillator
8. Arrays
9. UDO
10. Recorder
11. Additive synthesis
12. Amplitude modulation
13. Frequency modulation
14. Granulation
15. Delay lines
16. Filters
17. Subtractive synthesis
18. Vocoder
19. Physical models
20. FFT
21. Phase vocoder
22. Descriptors

## How to use

**Cabbage**

1. Install [Cabbage](https://cabbageaudio.com) (version 2.9) and open any `.csd` file from a lesson folder in `cabbage/`.
2. Read the comments in the code and play with the interface.
3. Examples that load sound files use relative paths to the shared `audio/` folder (e.g. `../../audio/1 Anechoic orchestra.wav`), so keep the folder structure as it is. In the granulator examples, use the *Open File* button and pick a file from `audio/`.

**Pure Data / Max**

1. Download the `csound7~` external for your system (links in [`pd/README.md`](pd/README.md) and [`max/README.md`](max/README.md)) and put it where Pd/Max can find it.
2. Open any `.pd` / `.maxpat` from the lesson folders in `pd/` or `max/`. Keep each `.csd` next to its patch.
3. Examples that play sound files have an *open file* button: pick a file from the shared `audio/` folder, then press *start*.

## Resources

- Csound: <https://csound.com>
- Cabbage: <https://cabbageaudio.com>
- The Csound FLOSS Manual: <https://flossmanual.csound.com>

## License

Released under the [MIT License](LICENSE). You are free to use, copy, modify and share this material, as long as you keep the copyright notice: please credit the original author.

## Author

Anthony Di Furia
