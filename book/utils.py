

def convertTupleToDict(tp):
    d = {}
    for e in tp:
        if len(e) != 2 :
            continue
        d[e[0]] =  e[1]
    return d

def convertTupleToDict_revert(tp):
    d = {}
    for e in tp:
        if len(e) != 2 :
            continue
        d[e[1]] =  e[0]
    return d


if __name__ == "__main__":
    HS = (
        (1, "fine"),
        (2, "medium"),
        (3, "coarse")
    )
    d = convertTupleToDict(HS)
    print(d)
    d = convertTupleToDict_revert(HS)
    print(d)
