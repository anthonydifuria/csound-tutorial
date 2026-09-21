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
     "text": "1 ADDITIVE SYNTHESIS",
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
     "maxclass": "live.dial",
     "patching_rect": [
      20.0,
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
        0.1
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "att",
       "parameter_mmax": 1.0,
       "parameter_mmin": 0.001,
       "parameter_modmode": 0,
       "parameter_shortname": "ATT",
       "parameter_type": 0
      }
     },
     "varname": "att"
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
     "text": "loadmess 0.1",
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
      150.0,
      110.0,
      22.0
     ],
     "text": "prepend att",
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
        0.1
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "dec",
       "parameter_mmax": 1.0,
       "parameter_mmin": 0.001,
       "parameter_modmode": 0,
       "parameter_shortname": "DEC",
       "parameter_type": 0
      }
     },
     "varname": "dec"
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
     "text": "loadmess 0.1",
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
     "text": "prepend dec",
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
        0.5
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "sus",
       "parameter_mmax": 1.0,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "SUS",
       "parameter_type": 0
      }
     },
     "varname": "sus"
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
     "id": "obj-11",
     "maxclass": "newobj",
     "patching_rect": [
      370.0,
      150.0,
      110.0,
      22.0
     ],
     "text": "prepend sus",
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
        0.3
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "rel",
       "parameter_mmax": 1.0,
       "parameter_mmin": 0.001,
       "parameter_modmode": 0,
       "parameter_shortname": "REL",
       "parameter_type": 0
      }
     },
     "varname": "rel"
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
     "text": "loadmess 0.3",
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
     "text": "prepend rel",
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
     "maxclass": "live.slider",
     "patching_rect": [
      720.0,
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
        1.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "a1",
       "parameter_mmax": 1.0,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "FUND",
       "parameter_type": 0
      }
     },
     "varname": "a1"
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
      202.0,
      110.0,
      22.0
     ],
     "text": "prepend a1",
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
     "maxclass": "live.slider",
     "patching_rect": [
      20.0,
      248.0,
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
        1.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "a2",
       "parameter_mmax": 1.0,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "2F",
       "parameter_type": 0
      }
     },
     "varname": "a2"
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
     "id": "obj-20",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      352.0,
      110.0,
      22.0
     ],
     "text": "prepend a2",
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
     "maxclass": "live.slider",
     "patching_rect": [
      195.0,
      248.0,
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
        1.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "a3",
       "parameter_mmax": 1.0,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "3F",
       "parameter_type": 0
      }
     },
     "varname": "a3"
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
      352.0,
      110.0,
      22.0
     ],
     "text": "prepend a3",
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
     "maxclass": "live.slider",
     "patching_rect": [
      370.0,
      248.0,
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
        1.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "a4",
       "parameter_mmax": 1.0,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "4f",
       "parameter_type": 0
      }
     },
     "varname": "a4"
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
     "id": "obj-26",
     "maxclass": "newobj",
     "patching_rect": [
      370.0,
      352.0,
      110.0,
      22.0
     ],
     "text": "prepend a4",
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
     "maxclass": "live.slider",
     "patching_rect": [
      545.0,
      248.0,
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
        1.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "a5",
       "parameter_mmax": 1.0,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "5f",
       "parameter_type": 0
      }
     },
     "varname": "a5"
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
     "id": "obj-29",
     "maxclass": "newobj",
     "patching_rect": [
      545.0,
      352.0,
      110.0,
      22.0
     ],
     "text": "prepend a5",
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
        0.5
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "out",
       "parameter_mmax": 1.0,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "Amplitude",
       "parameter_type": 0
      }
     },
     "varname": "out"
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
     "id": "obj-32",
     "maxclass": "newobj",
     "patching_rect": [
      720.0,
      300.0,
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
     "id": "obj-33",
     "maxclass": "button",
     "patching_rect": [
      20.0,
      398.0,
      24.0,
      24.0
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "bang"
     ]
    }
   },
   {
    "box": {
     "id": "obj-34",
     "maxclass": "comment",
     "patching_rect": [
      50.0,
      400.0,
      160.0,
      20.0
     ],
     "text": "CHANGE",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-35",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      428.0,
      50.0,
      22.0
     ],
     "text": "t b b",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-36",
     "maxclass": "message",
     "patching_rect": [
      20.0,
      458.0,
      60.0,
      22.0
     ],
     "text": "trigger 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-37",
     "maxclass": "newobj",
     "patching_rect": [
      90.0,
      458.0,
      70.0,
      22.0
     ],
     "text": "delay 60",
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
     "maxclass": "message",
     "patching_rect": [
      90.0,
      488.0,
      60.0,
      22.0
     ],
     "text": "trigger 0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-39",
     "maxclass": "umenu",
     "patching_rect": [
      195.0,
      398.0,
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
     "items": [
      "SERIES",
      ",",
      "SQUARE",
      ",",
      "SAW",
      ",",
      "TRIANGLE"
     ]
    }
   },
   {
    "box": {
     "id": "obj-40",
     "maxclass": "newobj",
     "patching_rect": [
      195.0,
      428.0,
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
     "id": "obj-41",
     "maxclass": "newobj",
     "patching_rect": [
      195.0,
      458.0,
      110.0,
      22.0
     ],
     "text": "prepend onde",
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
     "maxclass": "newobj",
     "patching_rect": [
      295.0,
      372.0,
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
     "id": "obj-43",
     "maxclass": "comment",
     "patching_rect": [
      20.0,
      558.0,
      500.0,
      20.0
     ],
     "text": "MIDI keyboard: click the keys (or use a connected MIDI keyboard through midiin)",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-44",
     "maxclass": "kslider",
     "patching_rect": [
      20.0,
      584.0,
      336.0,
      53.0
     ],
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "int",
      "int"
     ]
    }
   },
   {
    "box": {
     "id": "obj-45",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      646.0,
      70.0,
      22.0
     ],
     "text": "pack 0 0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-46",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      676.0,
      130.0,
      22.0
     ],
     "text": "prepend midi 144",
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
     "maxclass": "scope~",
     "patching_rect": [
      20.0,
      724.0,
      300.0,
      120.0
     ],
     "numinlets": 2,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-48",
     "maxclass": "comment",
     "patching_rect": [
      330.0,
      724.0,
      140.0,
      20.0
     ],
     "text": "output waveform",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-49",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      874.0,
      260.0,
      22.0
     ],
     "text": "csound7~ 1_ADDITIVE_SYNTHESIS.csd",
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
     "id": "obj-50",
     "maxclass": "ezdac~",
     "patching_rect": [
      20.0,
      924.0,
      45.0,
      45.0
     ],
     "numinlets": 2,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-51",
     "maxclass": "comment",
     "patching_rect": [
      300.0,
      874.0,
      400.0,
      20.0
     ],
     "text": "control messages go to the RIGHTMOST inlet (inlet 2)",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-52",
     "maxclass": "newobj",
     "patching_rect": [
      80.0,
      924.0,
      260.0,
      22.0
     ],
     "text": "route a1 a2 a3 a4 a5",
     "numinlets": 1,
     "numoutlets": 6,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-53",
     "maxclass": "message",
     "patching_rect": [
      80.0,
      956.0,
      60.0,
      22.0
     ],
     "text": "set $1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-54",
     "maxclass": "message",
     "patching_rect": [
      150.0,
      956.0,
      60.0,
      22.0
     ],
     "text": "set $1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-55",
     "maxclass": "message",
     "patching_rect": [
      220.0,
      956.0,
      60.0,
      22.0
     ],
     "text": "set $1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-56",
     "maxclass": "message",
     "patching_rect": [
      290.0,
      956.0,
      60.0,
      22.0
     ],
     "text": "set $1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-57",
     "maxclass": "message",
     "patching_rect": [
      360.0,
      956.0,
      60.0,
      22.0
     ],
     "text": "set $1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
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
      "obj-35",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-37",
      0
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
      "obj-38",
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
      "obj-39",
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
      "obj-40",
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
      "obj-41",
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
      "obj-45",
      0
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
      "obj-45",
      1
     ],
     "source": [
      "obj-44",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-46",
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
      "obj-49",
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
      "obj-49",
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
      "obj-49",
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
      "obj-49",
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
      "obj-49",
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
      "obj-49",
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
      "obj-49",
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
      "obj-49",
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
      "obj-49",
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
      "obj-49",
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
      "obj-49",
      2
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
      "obj-49",
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
      "obj-49",
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
      "obj-49",
      2
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
      "obj-50",
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
      1
     ],
     "source": [
      "obj-49",
      1
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
      "obj-49",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-52",
      0
     ],
     "source": [
      "obj-49",
      2
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
      "obj-52",
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
      "obj-53",
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
      "obj-52",
      1
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
      "obj-54",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-55",
      0
     ],
     "source": [
      "obj-52",
      2
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
      "obj-52",
      3
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
      "obj-56",
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
      "obj-52",
      4
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
      "obj-57",
      0
     ]
    }
   }
  ]
 }
}