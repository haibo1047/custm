import base64,sys,json
from Crypto.Cipher import AES


class WXBizDataCrypt:
    def __init__(self, appId, sessionKey):
        self.appId = appId
        self.sessionKey = sessionKey

    def decrypt(self, encryptedData, iv):
        # base64 decode
        sessionKey = base64.b64decode(self.sessionKey)
        encryptedData = base64.b64decode(encryptedData)
        iv = base64.b64decode(iv)

        cipher = AES.new(sessionKey, AES.MODE_CBC, iv)

        decrypted = json.loads(self._unpad(cipher.decrypt(encryptedData)))

        if decrypted['watermark']['appid'] != self.appId:
            raise Exception('Invalid Buffer')

        return decrypted

    def _unpad(self, s):
        return s[:-ord(s[len(s)-1:])]


def main():
    appId = 'wxb1d4e6d4e12fddc8'
    sessionKey = 'fyCSqYrq7NhJnhSM6xWeiA=='
    encryptedData = 'x8CrG5bcpp5tnyHmGNLlpia/dwjiaK8DOBgN6cIbvCjIM8zcA4oorFldoWTZGDBbQvHrpszi1S8v7zkvs4C/NOMab7oC134TNSC+FqDZ8xnIFzat72gzndPznCBMtIVT3GU3RBgLAfHNl/F6lvvbb/VGPJ3D0tvZ5Ng2v89KF1+8HiEvVELcSP3fVemuvWOLycyPZcRjT05D5jjLC7rL9dSMg3HZ+i9XzYs09Z8+EQXw40f5SDrWwGQZeBaxZASE8ySbs3rjGn44n+wYAjeDfzdsL7oJQ68XoQw+Tsvz8TaDMl+yoida+Bf98bmrQrpz7TdeywZTqmFpgTN1peucRgixo55M/PoZJkOSE+5RqkM2rlFRCf6PdYm7GHzjCSBb+QIODRGa3bqqJN0tGclUQyj9/ROiGmY+gnP2Vyj1/2dxgj9n63wWcj/dkgml5WJb5YfNyFlqgC2uJhKdzuTPaIu6fPtxfLK1A8+P1jhdZik='
    iv = 'bOuE9Et3XM+6mqTeENhqBQ=='
    # appId = 'wx4f4bc4dec97d474b'
    # sessionKey = 'tiihtNczf5v6AKRyjwEUhQ=='
    # encryptedData = 'CiyLU1Aw2KjvrjMdj8YKliAjtP4gsMZMQmRzooG2xrDcvSnxIMXFufNstNGTyaGS9uT5geRa0W4oTOb1WT7fJlAC+oNPdbB+3hVbJSRgv+4lGOETKUQz6OYStslQ142dNCuabNPGBzlooOmB231qMM85d2/fV6ChevvXvQP8Hkue1poOFtnEtpyxVLW1zAo6/1Xx1COxFvrc2d7UL/lmHInNlxuacJXwu0fjpXfz/YqYzBIBzD6WUfTIF9GRHpOn/Hz7saL8xz+W//FRAUid1OksQaQx4CMs8LOddcQhULW4ucetDf96JcR3g0gfRK4PC7E/r7Z6xNrXd2UIeorGj5Ef7b1pJAYB6Y5anaHqZ9J6nKEBvB4DnNLIVWSgARns/8wR2SiRS7MNACwTyrGvt9ts8p12PKFdlqYTopNHR1Vf7XjfhQlVsAJdNiKdYmYVoKlaRv85IfVunYzO0IKXsyl7JCUjCpoG20f0a04COwfneQAGGwd5oa+T8yO5hzuyDb/XcxxmK01EpqOyuxINew=='
    # iv = 'r7BXXKkLb8qrSNn05n0qiA=='

    pc = WXBizDataCrypt(appId, sessionKey)

    print(pc.decrypt(encryptedData, iv))

if __name__ == '__main__':
    main()
