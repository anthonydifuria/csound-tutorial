{
 "patcher": {
  "fileversion": 1,
  "appversion": {
   "major": 9,
   "minor": 0,
   "revision": 2,
   "architecture": "x64",
   "modernui": 1
  },
  "classnamespace": "box",
  "rect": [
   60.0,
   80.0,
   900.0,
   900.0
  ],
  "gridsize": [
   15.0,
   15.0
  ],
  "boxes": [
   {
    "box": {
     "id": "obj-1",
     "maxclass": "comment",
     "patching_rect": [
      20.0,
      12.0,
      500.0,
      20.0
     ],
     "text": "GRAIN_EVENT SYNTHETIC EXAMPLE",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-2",
     "maxclass": "comment",
     "patching_rect": [
      20.0,
      34.0,
      500.0,
      20.0
     ],
     "text": "Max version. Needs the csound7~ external: see README.md in the max folder of the repository",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-3",
     "maxclass": "live.slider",
     "patching_rect": [
      20.0,
      98.0,
      40.0,
      100.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "voce",
       "parameter_mmax": 1.0,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "2ND VOICE",
       "parameter_type": 0
      }
     },
     "varname": "voce"
    }
   },
   {
    "box": {
     "id": "obj-4",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      72.0,
      90.0,
      22.0
     ],
     "text": "loadmess 0",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-5",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      202.0,
      110.0,
      22.0
     ],
     "text": "prepend voce",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-6",
     "maxclass": "live.dial",
     "patching_rect": [
      195.0,
      98.0,
      44.0,
      48.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        200.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "dur",
       "parameter_mmax": 1000.0,
       "parameter_mmin": 2.0,
       "parameter_modmode": 0,
       "parameter_shortname": "DUR",
       "parameter_type": 0
      }
     },
     "varname": "dur"
    }
   },
   {
    "box": {
     "id": "obj-7",
     "maxclass": "newobj",
     "patching_rect": [
      195.0,
      72.0,
      90.0,
      22.0
     ],
     "text": "loadmess 200",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-8",
     "maxclass": "newobj",
     "patching_rect": [
      195.0,
      150.0,
      110.0,
      22.0
     ],
     "text": "prepend dur",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-9",
     "maxclass": "live.dial",
     "patching_rect": [
      370.0,
      98.0,
      44.0,
      48.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        1.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "harm",
       "parameter_mmax": 6.0,
       "parameter_mmin": 1.0,
       "parameter_modmode": 0,
       "parameter_shortname": "HARMONIC",
       "parameter_type": 0
      }
     },
     "varname": "harm"
    }
   },
   {
    "box": {
     "id": "obj-10",
     "maxclass": "newobj",
     "patching_rect": [
      370.0,
      72.0,
      90.0,
      22.0
     ],
     "text": "loadmess 1",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-11",
     "maxclass": "newobj",
     "patching_rect": [
      370.0,
      150.0,
      110.0,
      22.0
     ],
     "text": "prepend harm",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-12",
     "maxclass": "live.dial",
     "patching_rect": [
      545.0,
      98.0,
      44.0,
      48.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        100.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "freqModAM",
       "parameter_mmax": 400.0,
       "parameter_mmin": 0.1,
       "parameter_modmode": 0,
       "parameter_shortname": "FREQ MOD AM",
       "parameter_type": 0
      }
     },
     "varname": "freqModAM"
    }
   },
   {
    "box": {
     "id": "obj-13",
     "maxclass": "newobj",
     "patching_rect": [
      545.0,
      72.0,
      90.0,
      22.0
     ],
     "text": "loadmess 100",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-14",
     "maxclass": "newobj",
     "patching_rect": [
      545.0,
      150.0,
      110.0,
      22.0
     ],
     "text": "prepend freqModAM",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-15",
     "maxclass": "live.dial",
     "patching_rect": [
      720.0,
      98.0,
      44.0,
      48.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        1.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "spreadpan",
       "parameter_mmax": 1.0,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "SPREAD PAN",
       "parameter_type": 0
      }
     },
     "varname": "spreadpan"
    }
   },
   {
    "box": {
     "id": "obj-16",
     "maxclass": "newobj",
     "patching_rect": [
      720.0,
      72.0,
      90.0,
      22.0
     ],
     "text": "loadmess 1",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-17",
     "maxclass": "newobj",
     "patching_rect": [
      720.0,
      150.0,
      110.0,
      22.0
     ],
     "text": "prepend spreadpan",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-18",
     "maxclass": "live.dial",
     "patching_rect": [
      20.0,
      248.0,
      44.0,
      48.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "durRand",
       "parameter_mmax": 1.0,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "RAND DUR",
       "parameter_type": 0
      }
     },
     "varname": "durRand"
    }
   },
   {
    "box": {
     "id": "obj-19",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      222.0,
      90.0,
      22.0
     ],
     "text": "loadmess 0",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-20",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      300.0,
      110.0,
      22.0
     ],
     "text": "prepend durRand",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-21",
     "maxclass": "live.dial",
     "patching_rect": [
      195.0,
      248.0,
      44.0,
      48.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        1.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "spazioFreqArm",
       "parameter_mmax": 1.0,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "HARM FREQ SPACING",
       "parameter_type": 0
      }
     },
     "varname": "spazioFreqArm"
    }
   },
   {
    "box": {
     "id": "obj-22",
     "maxclass": "newobj",
     "patching_rect": [
      195.0,
      222.0,
      90.0,
      22.0
     ],
     "text": "loadmess 1",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-23",
     "maxclass": "newobj",
     "patching_rect": [
      195.0,
      300.0,
      110.0,
      22.0
     ],
     "text": "prepend spazioFreqArm",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-24",
     "maxclass": "live.dial",
     "patching_rect": [
      370.0,
      248.0,
      44.0,
      48.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        0.25
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "sine",
       "parameter_mmax": 0.75,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "SINE",
       "parameter_type": 0
      }
     },
     "varname": "sine"
    }
   },
   {
    "box": {
     "id": "obj-25",
     "maxclass": "newobj",
     "patching_rect": [
      370.0,
      222.0,
      90.0,
      22.0
     ],
     "text": "loadmess 0.25",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-26",
     "maxclass": "newobj",
     "patching_rect": [
      370.0,
      300.0,
      110.0,
      22.0
     ],
     "text": "prepend sine",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-27",
     "maxclass": "live.dial",
     "patching_rect": [
      545.0,
      248.0,
      44.0,
      48.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "amAmp",
       "parameter_mmax": 0.75,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "AM amp",
       "parameter_type": 0
      }
     },
     "varname": "amAmp"
    }
   },
   {
    "box": {
     "id": "obj-28",
     "maxclass": "newobj",
     "patching_rect": [
      545.0,
      222.0,
      90.0,
      22.0
     ],
     "text": "loadmess 0",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-29",
     "maxclass": "newobj",
     "patching_rect": [
      545.0,
      300.0,
      110.0,
      22.0
     ],
     "text": "prepend amAmp",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-30",
     "maxclass": "live.dial",
     "patching_rect": [
      720.0,
      248.0,
      44.0,
      48.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        50.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "den",
       "parameter_mmax": 100.0,
       "parameter_mmin": 1.0,
       "parameter_modmode": 0,
       "parameter_shortname": "DEN",
       "parameter_type": 0
      }
     },
     "varname": "den"
    }
   },
   {
    "box": {
     "id": "obj-31",
     "maxclass": "newobj",
     "patching_rect": [
      720.0,
      222.0,
      90.0,
      22.0
     ],
     "text": "loadmess 50",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-32",
     "maxclass": "newobj",
     "patching_rect": [
      720.0,
      300.0,
      110.0,
      22.0
     ],
     "text": "prepend den",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-33",
     "maxclass": "live.dial",
     "patching_rect": [
      20.0,
      398.0,
      44.0,
      48.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "fmAmp",
       "parameter_mmax": 0.75,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "FM amp",
       "parameter_type": 0
      }
     },
     "varname": "fmAmp"
    }
   },
   {
    "box": {
     "id": "obj-34",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      372.0,
      90.0,
      22.0
     ],
     "text": "loadmess 0",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-35",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      450.0,
      110.0,
      22.0
     ],
     "text": "prepend fmAmp",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-36",
     "maxclass": "live.dial",
     "patching_rect": [
      195.0,
      398.0,
      44.0,
      48.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        100.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "freqDevFM",
       "parameter_mmax": 500.0,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "FREQ DEV FM",
       "parameter_type": 0
      }
     },
     "varname": "freqDevFM"
    }
   },
   {
    "box": {
     "id": "obj-37",
     "maxclass": "newobj",
     "patching_rect": [
      195.0,
      372.0,
      90.0,
      22.0
     ],
     "text": "loadmess 100",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-38",
     "maxclass": "newobj",
     "patching_rect": [
      195.0,
      450.0,
      110.0,
      22.0
     ],
     "text": "prepend freqDevFM",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-39",
     "maxclass": "live.dial",
     "patching_rect": [
      370.0,
      398.0,
      44.0,
      48.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "densRand",
       "parameter_mmax": 1.0,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "RAND DENS",
       "parameter_type": 0
      }
     },
     "varname": "densRand"
    }
   },
   {
    "box": {
     "id": "obj-40",
     "maxclass": "newobj",
     "patching_rect": [
      370.0,
      372.0,
      90.0,
      22.0
     ],
     "text": "loadmess 0",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-41",
     "maxclass": "newobj",
     "patching_rect": [
      370.0,
      450.0,
      110.0,
      22.0
     ],
     "text": "prepend densRand",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-42",
     "maxclass": "live.dial",
     "patching_rect": [
      545.0,
      398.0,
      44.0,
      48.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "gliss",
       "parameter_mmax": 0.75,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "GLISS",
       "parameter_type": 0
      }
     },
     "varname": "gliss"
    }
   },
   {
    "box": {
     "id": "obj-43",
     "maxclass": "newobj",
     "patching_rect": [
      545.0,
      372.0,
      90.0,
      22.0
     ],
     "text": "loadmess 0",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-44",
     "maxclass": "newobj",
     "patching_rect": [
      545.0,
      450.0,
      110.0,
      22.0
     ],
     "text": "prepend gliss",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-45",
     "maxclass": "live.dial",
     "patching_rect": [
      720.0,
      398.0,
      44.0,
      48.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        3.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "num",
       "parameter_mmax": 10.0,
       "parameter_mmin": 1.0,
       "parameter_modmode": 0,
       "parameter_shortname": "NUM",
       "parameter_type": 0
      }
     },
     "varname": "num"
    }
   },
   {
    "box": {
     "id": "obj-46",
     "maxclass": "newobj",
     "patching_rect": [
      720.0,
      372.0,
      90.0,
      22.0
     ],
     "text": "loadmess 3",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-47",
     "maxclass": "newobj",
     "patching_rect": [
      720.0,
      450.0,
      110.0,
      22.0
     ],
     "text": "prepend num",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-48",
     "maxclass": "live.dial",
     "patching_rect": [
      20.0,
      548.0,
      44.0,
      48.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        200.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "freqModFM",
       "parameter_mmax": 500.0,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "FREQ MOD FM",
       "parameter_type": 0
      }
     },
     "varname": "freqModFM"
    }
   },
   {
    "box": {
     "id": "obj-49",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      522.0,
      90.0,
      22.0
     ],
     "text": "loadmess 200",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-50",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      600.0,
      110.0,
      22.0
     ],
     "text": "prepend freqModFM",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-51",
     "maxclass": "live.dial",
     "patching_rect": [
      195.0,
      548.0,
      44.0,
      48.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        300.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "ffond",
       "parameter_mmax": 1000.0,
       "parameter_mmin": 20.0,
       "parameter_modmode": 0,
       "parameter_shortname": "FUND FREQ",
       "parameter_type": 0
      }
     },
     "varname": "ffond"
    }
   },
   {
    "box": {
     "id": "obj-52",
     "maxclass": "newobj",
     "patching_rect": [
      195.0,
      522.0,
      90.0,
      22.0
     ],
     "text": "loadmess 300",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-53",
     "maxclass": "newobj",
     "patching_rect": [
      195.0,
      600.0,
      110.0,
      22.0
     ],
     "text": "prepend ffond",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-54",
     "maxclass": "live.dial",
     "patching_rect": [
      370.0,
      548.0,
      44.0,
      48.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "rev",
       "parameter_mmax": 0.75,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "REVERB",
       "parameter_type": 0
      }
     },
     "varname": "rev"
    }
   },
   {
    "box": {
     "id": "obj-55",
     "maxclass": "newobj",
     "patching_rect": [
      370.0,
      522.0,
      90.0,
      22.0
     ],
     "text": "loadmess 0",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-56",
     "maxclass": "newobj",
     "patching_rect": [
      370.0,
      600.0,
      110.0,
      22.0
     ],
     "text": "prepend rev",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-57",
     "maxclass": "live.dial",
     "patching_rect": [
      545.0,
      548.0,
      44.0,
      48.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        2.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "deno",
       "parameter_mmax": 10.0,
       "parameter_mmin": 1.0,
       "parameter_modmode": 0,
       "parameter_shortname": "DEN",
       "parameter_type": 0
      }
     },
     "varname": "deno"
    }
   },
   {
    "box": {
     "id": "obj-58",
     "maxclass": "newobj",
     "patching_rect": [
      545.0,
      522.0,
      90.0,
      22.0
     ],
     "text": "loadmess 2",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-59",
     "maxclass": "newobj",
     "patching_rect": [
      545.0,
      600.0,
      110.0,
      22.0
     ],
     "text": "prepend deno",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-60",
     "maxclass": "live.dial",
     "patching_rect": [
      720.0,
      548.0,
      44.0,
      48.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "room",
       "parameter_mmax": 0.999,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "ROOM",
       "parameter_type": 0
      }
     },
     "varname": "room"
    }
   },
   {
    "box": {
     "id": "obj-61",
     "maxclass": "newobj",
     "patching_rect": [
      720.0,
      522.0,
      90.0,
      22.0
     ],
     "text": "loadmess 0",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-62",
     "maxclass": "newobj",
     "patching_rect": [
      720.0,
      600.0,
      110.0,
      22.0
     ],
     "text": "prepend room",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-63",
     "maxclass": "live.dial",
     "patching_rect": [
      20.0,
      698.0,
      44.0,
      48.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "spreadfreq",
       "parameter_mmax": 400.0,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "SPREAD FREQ",
       "parameter_type": 0
      }
     },
     "varname": "spreadfreq"
    }
   },
   {
    "box": {
     "id": "obj-64",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      672.0,
      90.0,
      22.0
     ],
     "text": "loadmess 0",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-65",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      750.0,
      110.0,
      22.0
     ],
     "text": "prepend spreadfreq",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-66",
     "maxclass": "live.dial",
     "patching_rect": [
      195.0,
      698.0,
      44.0,
      48.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        1.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "geo",
       "parameter_mmax": 6.0,
       "parameter_mmin": 1.0,
       "parameter_modmode": 0,
       "parameter_shortname": "GEOMETRIC",
       "parameter_type": 0
      }
     },
     "varname": "geo"
    }
   },
   {
    "box": {
     "id": "obj-67",
     "maxclass": "newobj",
     "patching_rect": [
      195.0,
      672.0,
      90.0,
      22.0
     ],
     "text": "loadmess 1",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-68",
     "maxclass": "newobj",
     "patching_rect": [
      195.0,
      750.0,
      110.0,
      22.0
     ],
     "text": "prepend geo",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-69",
     "maxclass": "live.dial",
     "patching_rect": [
      370.0,
      698.0,
      44.0,
      48.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        0.25
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "out",
       "parameter_mmax": 1.0,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "OUTPUT",
       "parameter_type": 0
      }
     },
     "varname": "out"
    }
   },
   {
    "box": {
     "id": "obj-70",
     "maxclass": "newobj",
     "patching_rect": [
      370.0,
      672.0,
      90.0,
      22.0
     ],
     "text": "loadmess 0.25",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-71",
     "maxclass": "newobj",
     "patching_rect": [
      370.0,
      750.0,
      110.0,
      22.0
     ],
     "text": "prepend out",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-72",
     "maxclass": "live.dial",
     "patching_rect": [
      545.0,
      698.0,
      44.0,
      48.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        1.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "spazioFreqGeo",
       "parameter_mmax": 1.0,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "GEO FREQ SPACING",
       "parameter_type": 0
      }
     },
     "varname": "spazioFreqGeo"
    }
   },
   {
    "box": {
     "id": "obj-73",
     "maxclass": "newobj",
     "patching_rect": [
      545.0,
      672.0,
      90.0,
      22.0
     ],
     "text": "loadmess 1",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-74",
     "maxclass": "newobj",
     "patching_rect": [
      545.0,
      750.0,
      110.0,
      22.0
     ],
     "text": "prepend spazioFreqGeo",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-75",
     "maxclass": "umenu",
     "patching_rect": [
      720.0,
      698.0,
      160.0,
      22.0
     ],
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "int",
      "",
      ""
     ],
     "items": []
    }
   },
   {
    "box": {
     "id": "obj-76",
     "maxclass": "newobj",
     "patching_rect": [
      720.0,
      728.0,
      40.0,
      22.0
     ],
     "text": "+ 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-77",
     "maxclass": "newobj",
     "patching_rect": [
      720.0,
      758.0,
      110.0,
      22.0
     ],
     "text": "prepend func",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-78",
     "maxclass": "newobj",
     "patching_rect": [
      820.0,
      672.0,
      80.0,
      22.0
     ],
     "text": "loadmess 0",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-79",
     "maxclass": "live.dial",
     "patching_rect": [
      20.0,
      848.0,
      44.0,
      48.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        0.5
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "x",
       "parameter_mmax": 1.0,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "x (x)",
       "parameter_type": 0
      }
     },
     "varname": "x"
    }
   },
   {
    "box": {
     "id": "obj-80",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      822.0,
      90.0,
      22.0
     ],
     "text": "loadmess 0.5",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-81",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      900.0,
      110.0,
      22.0
     ],
     "text": "prepend x",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-82",
     "maxclass": "live.dial",
     "patching_rect": [
      195.0,
      848.0,
      44.0,
      48.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        0.5
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "y",
       "parameter_mmax": 1.0,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "y (y)",
       "parameter_type": 0
      }
     },
     "varname": "y"
    }
   },
   {
    "box": {
     "id": "obj-83",
     "maxclass": "newobj",
     "patching_rect": [
      195.0,
      822.0,
      90.0,
      22.0
     ],
     "text": "loadmess 0.5",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-84",
     "maxclass": "newobj",
     "patching_rect": [
      195.0,
      900.0,
      110.0,
      22.0
     ],
     "text": "prepend y",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-85",
     "maxclass": "live.toggle",
     "patching_rect": [
      370.0,
      848.0,
      24.0,
      24.0
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "onPAD",
       "parameter_mmax": 1,
       "parameter_shortname": "onPAD",
       "parameter_type": 2
      }
     },
     "varname": "onPAD"
    }
   },
   {
    "box": {
     "id": "obj-86",
     "maxclass": "comment",
     "patching_rect": [
      400.0,
      850.0,
      160.0,
      20.0
     ],
     "text": "onPAD",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-87",
     "maxclass": "newobj",
     "patching_rect": [
      370.0,
      880.0,
      110.0,
      22.0
     ],
     "text": "prepend onPAD",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-88",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      1018.0,
      260.0,
      22.0
     ],
     "text": "csound7~ GRAIN_EVENT_SYNTHETIC_EXAMPLE.csd",
     "numinlets": 3,
     "numoutlets": 3,
     "outlettype": [
      "signal",
      "signal",
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-89",
     "maxclass": "ezdac~",
     "patching_rect": [
      20.0,
      1068.0,
      45.0,
      45.0
     ],
     "numinlets": 2,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-90",
     "maxclass": "comment",
     "patching_rect": [
      300.0,
      1018.0,
      400.0,
      20.0
     ],
     "text": "control messages go to the RIGHTMOST inlet (inlet 2)",
     "numinlets": 1,
     "numoutlets": 0
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "destination": [
      "obj-3",
      0
     ],
     "source": [
      "obj-4",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-5",
      0
     ],
     "source": [
      "obj-3",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-6",
      0
     ],
     "source": [
      "obj-7",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-8",
      0
     ],
     "source": [
      "obj-6",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-9",
      0
     ],
     "source": [
      "obj-10",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-11",
      0
     ],
     "source": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-12",
      0
     ],
     "source": [
      "obj-13",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-14",
      0
     ],
     "source": [
      "obj-12",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-15",
      0
     ],
     "source": [
      "obj-16",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-17",
      0
     ],
     "source": [
      "obj-15",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-18",
      0
     ],
     "source": [
      "obj-19",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-20",
      0
     ],
     "source": [
      "obj-18",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-21",
      0
     ],
     "source": [
      "obj-22",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-23",
      0
     ],
     "source": [
      "obj-21",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-24",
      0
     ],
     "source": [
      "obj-25",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-26",
      0
     ],
     "source": [
      "obj-24",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-27",
      0
     ],
     "source": [
      "obj-28",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-29",
      0
     ],
     "source": [
      "obj-27",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-30",
      0
     ],
     "source": [
      "obj-31",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-32",
      0
     ],
     "source": [
      "obj-30",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-33",
      0
     ],
     "source": [
      "obj-34",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-35",
      0
     ],
     "source": [
      "obj-33",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-36",
      0
     ],
     "source": [
      "obj-37",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-38",
      0
     ],
     "source": [
      "obj-36",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-39",
      0
     ],
     "source": [
      "obj-40",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-41",
      0
     ],
     "source": [
      "obj-39",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-42",
      0
     ],
     "source": [
      "obj-43",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-44",
      0
     ],
     "source": [
      "obj-42",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-45",
      0
     ],
     "source": [
      "obj-46",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-47",
      0
     ],
     "source": [
      "obj-45",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-48",
      0
     ],
     "source": [
      "obj-49",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-50",
      0
     ],
     "source": [
      "obj-48",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-51",
      0
     ],
     "source": [
      "obj-52",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-53",
      0
     ],
     "source": [
      "obj-51",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-54",
      0
     ],
     "source": [
      "obj-55",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-56",
      0
     ],
     "source": [
      "obj-54",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-57",
      0
     ],
     "source": [
      "obj-58",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-59",
      0
     ],
     "source": [
      "obj-57",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-60",
      0
     ],
     "source": [
      "obj-61",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-62",
      0
     ],
     "source": [
      "obj-60",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-63",
      0
     ],
     "source": [
      "obj-64",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-65",
      0
     ],
     "source": [
      "obj-63",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-66",
      0
     ],
     "source": [
      "obj-67",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-68",
      0
     ],
     "source": [
      "obj-66",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-69",
      0
     ],
     "source": [
      "obj-70",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-71",
      0
     ],
     "source": [
      "obj-69",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-72",
      0
     ],
     "source": [
      "obj-73",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-74",
      0
     ],
     "source": [
      "obj-72",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-75",
      0
     ],
     "source": [
      "obj-78",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-76",
      0
     ],
     "source": [
      "obj-75",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-77",
      0
     ],
     "source": [
      "obj-76",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-79",
      0
     ],
     "source": [
      "obj-80",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-81",
      0
     ],
     "source": [
      "obj-79",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-82",
      0
     ],
     "source": [
      "obj-83",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-84",
      0
     ],
     "source": [
      "obj-82",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-87",
      0
     ],
     "source": [
      "obj-85",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-8",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-11",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-14",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-17",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-20",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-23",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-26",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-29",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-32",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-35",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-38",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-41",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-44",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-47",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-50",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-53",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-56",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-59",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-62",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-65",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-68",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-71",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-74",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-77",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-81",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-84",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-87",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-89",
      0
     ],
     "source": [
      "obj-88",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-89",
      1
     ],
     "source": [
      "obj-88",
      1
     ]
    }
   }
  ]
 }
}