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
     "text": "CONCRETE GRANULATOR 4 FILT",
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
        1.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "ratePlay",
       "parameter_mmax": 2.0,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "RATE PLAY",
       "parameter_type": 0
      }
     },
     "varname": "ratePlay"
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
     "id": "obj-5",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      150.0,
      110.0,
      22.0
     ],
     "text": "prepend ratePlay",
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
     "maxclass": "comment",
     "patching_rect": [
      195.0,
      98.0,
      160.0,
      20.0
     ],
     "text": "nch",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-7",
     "maxclass": "flonum",
     "patching_rect": [
      195.0,
      120.0,
      70.0,
      22.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ]
    }
   },
   {
    "box": {
     "id": "obj-8",
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
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "spreadPos",
       "parameter_mmax": 1.0,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "Spread Position",
       "parameter_type": 0
      }
     },
     "varname": "spreadPos"
    }
   },
   {
    "box": {
     "id": "obj-9",
     "maxclass": "newobj",
     "patching_rect": [
      370.0,
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
     "id": "obj-10",
     "maxclass": "newobj",
     "patching_rect": [
      370.0,
      150.0,
      110.0,
      22.0
     ],
     "text": "prepend spreadPos",
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
     "maxclass": "comment",
     "patching_rect": [
      545.0,
      98.0,
      160.0,
      20.0
     ],
     "text": "durata",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-12",
     "maxclass": "flonum",
     "patching_rect": [
      545.0,
      120.0,
      70.0,
      22.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ]
    }
   },
   {
    "box": {
     "id": "obj-13",
     "maxclass": "live.toggle",
     "patching_rect": [
      720.0,
      98.0,
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
       "parameter_longname": "onoff",
       "parameter_mmax": 1,
       "parameter_shortname": "ON/OFF",
       "parameter_type": 2
      }
     },
     "varname": "onoff"
    }
   },
   {
    "box": {
     "id": "obj-14",
     "maxclass": "comment",
     "patching_rect": [
      750.0,
      100.0,
      160.0,
      20.0
     ],
     "text": "ON/OFF",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-15",
     "maxclass": "newobj",
     "patching_rect": [
      720.0,
      130.0,
      110.0,
      22.0
     ],
     "text": "prepend onoff",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-16",
     "maxclass": "comment",
     "patching_rect": [
      20.0,
      248.0,
      160.0,
      20.0
     ],
     "text": "posPhase",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-17",
     "maxclass": "flonum",
     "patching_rect": [
      20.0,
      270.0,
      70.0,
      22.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ]
    }
   },
   {
    "box": {
     "id": "obj-18",
     "maxclass": "comment",
     "patching_rect": [
      195.0,
      248.0,
      160.0,
      20.0
     ],
     "text": "phasefreq",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-19",
     "maxclass": "flonum",
     "patching_rect": [
      195.0,
      270.0,
      70.0,
      22.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ]
    }
   },
   {
    "box": {
     "id": "obj-20",
     "maxclass": "live.toggle",
     "patching_rect": [
      370.0,
      248.0,
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
       "parameter_longname": "PlayStop",
       "parameter_mmax": 1,
       "parameter_shortname": "Play/Stop",
       "parameter_type": 2
      }
     },
     "varname": "PlayStop"
    }
   },
   {
    "box": {
     "id": "obj-21",
     "maxclass": "comment",
     "patching_rect": [
      400.0,
      250.0,
      160.0,
      20.0
     ],
     "text": "Play/Stop",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-22",
     "maxclass": "newobj",
     "patching_rect": [
      370.0,
      280.0,
      110.0,
      22.0
     ],
     "text": "prepend PlayStop",
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
     "maxclass": "comment",
     "patching_rect": [
      545.0,
      248.0,
      160.0,
      20.0
     ],
     "text": "lungtab",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-24",
     "maxclass": "flonum",
     "patching_rect": [
      545.0,
      270.0,
      70.0,
      22.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ]
    }
   },
   {
    "box": {
     "id": "obj-25",
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
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "spreadpan",
       "parameter_mmax": 1.0,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "Spread Pan",
       "parameter_type": 0
      }
     },
     "varname": "spreadpan"
    }
   },
   {
    "box": {
     "id": "obj-26",
     "maxclass": "newobj",
     "patching_rect": [
      720.0,
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
     "id": "obj-27",
     "maxclass": "newobj",
     "patching_rect": [
      720.0,
      300.0,
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
     "id": "obj-28",
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
     "id": "obj-29",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      372.0,
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
     "id": "obj-30",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      450.0,
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
     "id": "obj-31",
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
     "id": "obj-32",
     "maxclass": "newobj",
     "patching_rect": [
      195.0,
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
     "id": "obj-33",
     "maxclass": "newobj",
     "patching_rect": [
      195.0,
      450.0,
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
     "id": "obj-34",
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
        1.0
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
     "id": "obj-35",
     "maxclass": "newobj",
     "patching_rect": [
      370.0,
      372.0,
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
     "id": "obj-36",
     "maxclass": "newobj",
     "patching_rect": [
      370.0,
      450.0,
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
     "id": "obj-37",
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
     "id": "obj-38",
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
     "id": "obj-39",
     "maxclass": "newobj",
     "patching_rect": [
      545.0,
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
     "id": "obj-40",
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
        1.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "detune",
       "parameter_mmax": 1.0,
       "parameter_mmin": 0.125,
       "parameter_modmode": 0,
       "parameter_shortname": "TUNE",
       "parameter_type": 0
      }
     },
     "varname": "detune"
    }
   },
   {
    "box": {
     "id": "obj-41",
     "maxclass": "newobj",
     "patching_rect": [
      720.0,
      372.0,
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
     "id": "obj-42",
     "maxclass": "newobj",
     "patching_rect": [
      720.0,
      450.0,
      110.0,
      22.0
     ],
     "text": "prepend detune",
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
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "spreadTune",
       "parameter_mmax": 1.0,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "SPREADTUNE",
       "parameter_type": 0
      }
     },
     "varname": "spreadTune"
    }
   },
   {
    "box": {
     "id": "obj-44",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
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
     "id": "obj-45",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      600.0,
      110.0,
      22.0
     ],
     "text": "prepend spreadTune",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-46",
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
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "rev",
       "parameter_mmax": 1.0,
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
     "id": "obj-47",
     "maxclass": "newobj",
     "patching_rect": [
      195.0,
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
     "id": "obj-48",
     "maxclass": "newobj",
     "patching_rect": [
      195.0,
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
     "id": "obj-49",
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
     "id": "obj-50",
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
     "id": "obj-51",
     "maxclass": "newobj",
     "patching_rect": [
      370.0,
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
     "id": "obj-52",
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
     "id": "obj-53",
     "maxclass": "newobj",
     "patching_rect": [
      545.0,
      522.0,
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
     "id": "obj-54",
     "maxclass": "newobj",
     "patching_rect": [
      545.0,
      600.0,
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
     "id": "obj-55",
     "maxclass": "umenu",
     "patching_rect": [
      720.0,
      548.0,
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
     "id": "obj-56",
     "maxclass": "newobj",
     "patching_rect": [
      720.0,
      578.0,
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
     "id": "obj-57",
     "maxclass": "newobj",
     "patching_rect": [
      720.0,
      608.0,
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
     "id": "obj-58",
     "maxclass": "newobj",
     "patching_rect": [
      820.0,
      522.0,
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
     "id": "obj-59",
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
        1.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "harm",
       "parameter_mmax": 5.0,
       "parameter_mmin": 1.0,
       "parameter_modmode": 0,
       "parameter_shortname": "HARM",
       "parameter_type": 0
      }
     },
     "varname": "harm"
    }
   },
   {
    "box": {
     "id": "obj-60",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
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
     "id": "obj-61",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      750.0,
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
     "id": "obj-62",
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
        0.5
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "ampFilt",
       "parameter_mmax": 1.0,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "ampFilt",
       "parameter_type": 0
      }
     },
     "varname": "ampFilt"
    }
   },
   {
    "box": {
     "id": "obj-63",
     "maxclass": "newobj",
     "patching_rect": [
      195.0,
      672.0,
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
     "id": "obj-64",
     "maxclass": "newobj",
     "patching_rect": [
      195.0,
      750.0,
      110.0,
      22.0
     ],
     "text": "prepend ampFilt",
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
        200.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "FreqFilt",
       "parameter_mmax": 2000.0,
       "parameter_mmin": 20.0,
       "parameter_modmode": 0,
       "parameter_shortname": "FreqFilt",
       "parameter_type": 0
      }
     },
     "varname": "FreqFilt"
    }
   },
   {
    "box": {
     "id": "obj-66",
     "maxclass": "newobj",
     "patching_rect": [
      370.0,
      672.0,
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
     "id": "obj-67",
     "maxclass": "newobj",
     "patching_rect": [
      370.0,
      750.0,
      110.0,
      22.0
     ],
     "text": "prepend FreqFilt",
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
        10000.0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "CutOff",
       "parameter_mmax": 10000.0,
       "parameter_mmin": 100.0,
       "parameter_modmode": 0,
       "parameter_shortname": "CutOff",
       "parameter_type": 0
      }
     },
     "varname": "CutOff"
    }
   },
   {
    "box": {
     "id": "obj-69",
     "maxclass": "newobj",
     "patching_rect": [
      545.0,
      672.0,
      90.0,
      22.0
     ],
     "text": "loadmess 10000",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-70",
     "maxclass": "newobj",
     "patching_rect": [
      545.0,
      750.0,
      110.0,
      22.0
     ],
     "text": "prepend CutOff",
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
     "maxclass": "live.dial",
     "patching_rect": [
      720.0,
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
        0.8
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "Feedback",
       "parameter_mmax": 0.999,
       "parameter_mmin": 0.0,
       "parameter_modmode": 0,
       "parameter_shortname": "Feedback",
       "parameter_type": 0
      }
     },
     "varname": "Feedback"
    }
   },
   {
    "box": {
     "id": "obj-72",
     "maxclass": "newobj",
     "patching_rect": [
      720.0,
      672.0,
      90.0,
      22.0
     ],
     "text": "loadmess 0.8",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-73",
     "maxclass": "newobj",
     "patching_rect": [
      720.0,
      750.0,
      110.0,
      22.0
     ],
     "text": "prepend Feedback",
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
     "maxclass": "button",
     "patching_rect": [
      20.0,
      858.0,
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
     "id": "obj-75",
     "maxclass": "comment",
     "patching_rect": [
      50.0,
      860.0,
      260.0,
      20.0
     ],
     "text": "open a sound file (filename)",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-76",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      890.0,
      80.0,
      22.0
     ],
     "text": "opendialog",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ]
    }
   },
   {
    "box": {
     "id": "obj-77",
     "maxclass": "newobj",
     "patching_rect": [
      20.0,
      920.0,
      200.0,
      22.0
     ],
     "text": "prepend diskinfile filename",
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
      20.0,
      968.0,
      260.0,
      22.0
     ],
     "text": "csound7~ CONCRETE_GRANULATOR_4_FILT.csd",
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
     "id": "obj-79",
     "maxclass": "ezdac~",
     "patching_rect": [
      20.0,
      1018.0,
      45.0,
      45.0
     ],
     "numinlets": 2,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-80",
     "maxclass": "comment",
     "patching_rect": [
      300.0,
      968.0,
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
     "id": "obj-81",
     "maxclass": "newobj",
     "patching_rect": [
      80.0,
      1018.0,
      260.0,
      22.0
     ],
     "text": "route nch lungtab durata phasefreq posPhase",
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
     "id": "obj-82",
     "maxclass": "message",
     "patching_rect": [
      80.0,
      1050.0,
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
     "id": "obj-83",
     "maxclass": "message",
     "patching_rect": [
      150.0,
      1050.0,
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
     "id": "obj-84",
     "maxclass": "message",
     "patching_rect": [
      220.0,
      1050.0,
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
     "id": "obj-85",
     "maxclass": "message",
     "patching_rect": [
      290.0,
      1050.0,
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
     "id": "obj-86",
     "maxclass": "message",
     "patching_rect": [
      360.0,
      1050.0,
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
      "obj-8",
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
      "obj-10",
      0
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
      "obj-15",
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
      "obj-22",
      0
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
      "obj-25",
      0
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
      "obj-27",
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
      "obj-28",
      0
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
      "obj-30",
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
      "obj-31",
      0
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
      "obj-33",
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
      "obj-34",
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
      "obj-36",
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
      "obj-37",
      0
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
      "obj-39",
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
      "obj-40",
      0
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
      "obj-42",
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
      "obj-43",
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
      "obj-46",
      0
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
      "obj-48",
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
      "obj-49",
      0
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
      "obj-51",
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
      "obj-58",
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
      "obj-55",
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
      "obj-56",
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
      "obj-60",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-61",
      0
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
      "obj-62",
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
      "obj-64",
      0
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
      "obj-65",
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
      "obj-67",
      0
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
      "obj-68",
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
      "obj-70",
      0
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
      "obj-71",
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
      "obj-73",
      0
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
      "obj-76",
      0
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
      "obj-78",
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
      "obj-78",
      2
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
      "obj-78",
      2
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
      "obj-78",
      2
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
      "obj-78",
      2
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
      "obj-78",
      2
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
      "obj-78",
      2
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
      "obj-78",
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
      "obj-78",
      2
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
      "obj-78",
      2
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
      "obj-78",
      2
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
      "obj-78",
      2
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
      "obj-78",
      2
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
      "obj-78",
      2
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
      "obj-78",
      2
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
      "obj-78",
      2
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
      "obj-78",
      2
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
      "obj-78",
      2
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
      "obj-78",
      2
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
      "obj-78",
      2
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
      "obj-78",
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
      "obj-79",
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
      "obj-79",
      1
     ],
     "source": [
      "obj-78",
      1
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
      "obj-78",
      2
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
      "obj-81",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-7",
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
      "obj-83",
      0
     ],
     "source": [
      "obj-81",
      1
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
      "obj-81",
      2
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
      "obj-84",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-85",
      0
     ],
     "source": [
      "obj-81",
      3
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-19",
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
      "obj-86",
      0
     ],
     "source": [
      "obj-81",
      4
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
      "obj-86",
      0
     ]
    }
   }
  ]
 }
}