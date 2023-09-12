Red[]

move2win: func[
    matches [integer!] 
    max2pick [integer!] 
    type [string!] 
    winmatch [integer!]]
    [
    either winmatch <= max2pick[
    either type == "n" [
    either ((matches - winmatch) % (max2pick + 1)) == 0[print winmatch]
    [move2win matches max2pick type winmatch + 1]
    ][either ((matches - winmatch - 1 ) % (max2pick + 1)) == 0[print winmatch]
    [move2win matches max2pick type winmatch + 1]]
    ][
        print 0
    ]

]
MatchesPicking: func[][
    dataInput: input
    splitInput: split dataInput " "
    matches: to-integer pick splitInput 1
    max2pick: to-integer pick splitInput 2
    type: to-string pick splitInput 3
    move2win matches max2pick type 0
]

cycleChecker: func [
    n [integer!]
][
    if n > 0 [
        MatchesPicking
        cycleChecker n - 1
    ]
]

cycles: input
cycleChecker to-integer cycles
