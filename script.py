#! /usr/bin/python
#! -*- coding: utf-8 -*-

import sys, paramiko, re

if len(sys.argv) > 1:
    username = sys.argv[1]

    s=paramiko.SSHClient()
    s.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    s.connect('localhost', username='tester', password='adam')
    a,b,c=s.exec_command("GET /etc/passwd") #2
    #a,b,c=s.exec_command("grep -c '^{0}:' /etc/passwd".format(username)) #1

    #count = b.read().rstrip() #1
    count = b.read().rstrip().split('\n') #2

    for i in count: #2
        #if i.find(username) >= 0: #2
        if re.search(username, i): #wyrażenia regularne
            print u"Użytkownik {} istnieje !".format(username) #2
            print i #2
            break #2
    else: #2
        print u"Użytkownik {} nie istnieje !".format(username) #2

    #if username in count: #1
    #if count == "1": #1
         #print u"Użytkownik {} istnieje !".format(username) #1
    #else: #1
         #print u"Użytkownik {} nie istnieje !".format(username) #1
else:
    print u'Podaj nazwe użytkownika do znalezienia !'
