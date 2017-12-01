import urllib.request,urllib.parse
import json,base64
from django.conf import settings
from django.contrib.auth.models import User
from .WXBizDataCrypt import WXBizDataCrypt

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
        "appid":getattr(settings, 'WE_APPID'),
        "secret":getattr(settings, 'WE_SECRET'),
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

def wechatcheckuser(openid):
    try:
        theuser = User.objects.get(username=openid)
    except User.DoesNotExist:
        return False
    return theuser is not None

def wechatregister(registerData):
    rd = json.loads(urllib.request.unquote(registerData))
    session_key = rd["session_key"]
    encryptedData = rd["encryptedData"]
    iv = rd["iv"]
    pc = WXBizDataCrypt(getattr(settings, 'WE_APPID'), session_key)
    info = ""
    try:
        info = pc.decrypt(encryptedData,iv)
    except UnicodeDecodeError:
        print('can not decrypt')
    return info


if __name__ == "__main__":
    wechatlogin("abc")