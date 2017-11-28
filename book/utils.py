import urllib,json

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

def wechatlogin(code):
    values = {
        "appid":"wxb1d4e6d4e12fddc8",
        "secret":"7be9d98d16276430a26848ca0c8ccd50",
        "js_code":code,
        "grant_type":"authorization_code"
    }
    url = "https://api.weixin.qq.com/sns/jscode2session"
    data = urllib.parse.urlencode(values)
    data = data.encode('utf-8')
    req = urllib.request.Request(url, data)
    with urllib.request.urlopen(req) as response:
        res = response.read()
        # jo = json.loads(response.read())
        # print(jo)
        # if "errcode" not in jo:
        #     return jo["openid"]
        print(res)
        return res
    return None

if __name__ == "__main__":
    wechatlogin("abc")