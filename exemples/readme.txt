
## Convertir un fichier flv en mp4 ##
avconv -i 7a77e018df5a03ba3d470504bb3e3977_690ce18c54067c0876c2ebbd56f99688_Seg1-Frag.flv -codec copy "Doublement Marianne - S01E30.mp4"

## Télécharger une video au format flv ##
ruby run.rb 'php AdobeHDS.php --manifest "http://web.q1.tf1.fr/2/USP-0x0/37/48/12973748/ssm/12973748.ism/12973748.f4m?vk=MTI5NzM3NDguZjRt&st=xec3RuXYtJeyXBbUiYtExw&e=1458373206&t=1458243606&bu=TFOU&login=robin-des-bois-tfou&i=109.221.133.144&u=a4aedc160f4db1107389aac31a34e732&sum=5a0a44755960214f1b01e6ea550de796&min_bitrate=700000&max_bitrate=2000000&seek=wat&hdcore=2.11.3&g=HWYXWVCADHPV" --delete --auth "vk=MTI5NzM3NDguZjRt&st=xec3RuXYtJeyXBbUiYtExw&e=1458373206&t=1458243606&bu=TFOU&login=robin-des-bois-tfou&i=109.221.133.144&u=a4aedc160f4db1107389aac31a34e732&sum=5a0a44755960214f1b01e6ea550de796&min_bitrate=700000&max_bitrate=2000000&seek=wat&als=0,2,0,1,0,NaN,0,0,0,127,f,0,659.52,f,s,HWYXWVCADHPV,2.11.3,127&hdcore=2.11.3" --useragent "Mozilla/5.0 (X11; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0"' "La flèche magique" "2"

php AdobeHDS.php --manifest "http://web.q1.tf1.fr/2/USP-0x0/02/59/12980259/ssm/12980259.ism/12980259.f4m?vk=MTI5ODAyNTkuZjRt&st=yksx3cZ2xTPsg06ojvxzvw&e=1460859428&t=1460729828&bu=TFOU&login=mini-ninjas&i=90.126.57.100&u=a4aedc160f4db1107389aac31a34e732&sum=04ac0c6c8456b0696bc3d459fda8b811&min_bitrate=700000&max_bitrate=2000000&seek=wat&hdcore=2.11.3&g=OBBNQIFOJLOO" --delete --auth "vk=MTI5ODAyNTkuZjRt&st=yksx3cZ2xTPsg06ojvxzvw&e=1460859428&t=1460729828&bu=TFOU&login=mini-ninjas&i=90.126.57.100&u=a4aedc160f4db1107389aac31a34e732&sum=04ac0c6c8456b0696bc3d459fda8b811&min_bitrate=700000&max_bitrate=2000000&seek=wat&als=0,2,0,1,0,NaN,0,0,0,41,f,0,630,f,s,OBBNQIFOJLOO,2.11.3,41&hdcore=2.11.3" --useragent "Mozilla/5.0 (X11; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0"


## Télécharger une video de mini-ninjas au format flv ##

php AdobeHDS.php --manifest "http://web.q1.tf1.fr/2/USP-0x0/38/37/12983837/ssm/12983837.ism/12983837.f4m?vk=MTI5ODM4MzcuZjRt&st=U4-uXl5XYcQPjZhjMGQsgw&e=1461029638&t=1460900038&bu=TFOU&login=mini-ninjas&i=90.126.57.100&u=a4aedc160f4db1107389aac31a34e732&sum=04ac0c6c8456b0696bc3d459fda8b811&min_bitrate=700000&max_bitrate=2000000&seek=wat&hdcore=2.11.3&g=JICNUIZXWGVN" --delete --auth "vk=MTI5ODM4MzcuZjRt&st=U4-uXl5XYcQPjZhjMGQsgw&e=1461029638&t=1460900038&bu=TFOU&login=mini-ninjas&i=90.126.57.100&u=a4aedc160f4db1107389aac31a34e732&sum=04ac0c6c8456b0696bc3d459fda8b811&min_bitrate=700000&max_bitrate=2000000&seek=wat&als=0,2,0,1,0,NaN,0,0,0,26,f,0,629.12,f,s,JICNUIZXWGVN,2.11.3,26&hdcore=2.11.3" --useragent "Mozilla/5.0 (X11; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0"

** url **

http://web.q1.tf1.fr/2/USP-0x0/38/37/12983837/ssm/12983837.ism/12983837.f4m?vk=MTI5ODM4MzcuZjRt&st=U4-uXl5XYcQPjZhjMGQsgw&e=1461029638&t=1460900038&bu=TFOU&login=mini-ninjas&i=90.126.57.100&u=a4aedc160f4db1107389aac31a34e732&sum=04ac0c6c8456b0696bc3d459fda8b811&min_bitrate=700000&max_bitrate=2000000&seek=wat&hdcore=2.11.3&g=JICNUIZXWGVN

** A partir d'une url **

php AdobeHDS.php --delete --manifest "<url>" --auth "<url>&als=0,2,0,1,0,NaN,0,0,0,36,f,0,660,f,s,UDIIHDKRBYRM,2.11.3,36" --useragent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36"


## Télécharger une video de heidi au format flv ##

php AdobeHDS.php --manifest "http://web.q1.tf1.fr/2/USP-0x0/39/16/12983916/ssm/12983916.ism/12983916.f4m?vk=MTI5ODM5MTYuZjRt&st=THi63w2mpD9KCvG-NoM3UQ&e=1461030732&t=1460901132&bu=TFOU&login=heidi-tfou&i=90.126.57.100&u=a4aedc160f4db1107389aac31a34e732&sum=04ac0c6c8456b0696bc3d459fda8b811&min_bitrate=700000&max_bitrate=2000000&seek=wat&hdcore=2.11.3&g=ISBQNEIHITHY" --delete --auth "vk=MTI5ODM5MTYuZjRt&st=THi63w2mpD9KCvG-NoM3UQ&e=1461030732&t=1460901132&bu=TFOU&login=heidi-tfou&i=90.126.57.100&u=a4aedc160f4db1107389aac31a34e732&sum=04ac0c6c8456b0696bc3d459fda8b811&min_bitrate=700000&max_bitrate=2000000&seek=wat&als=0,3,0,1,0,NaN,0,0,0,41,f,0,1260,f,s,ISBQNEIHITHY,2.11.3,41&hdcore=2.11.3" --useragent "Mozilla/5.0 (X11; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0"

** url **

http://web.q1.tf1.fr/2/USP-0x0/39/16/12983916/ssm/12983916.ism/12983916.f4m?vk=MTI5ODM5MTYuZjRt&st=THi63w2mpD9KCvG-NoM3UQ&e=1461030732&t=1460901132&bu=TFOU&login=heidi-tfou&i=90.126.57.100&u=a4aedc160f4db1107389aac31a34e732&sum=04ac0c6c8456b0696bc3d459fda8b811&min_bitrate=700000&max_bitrate=2000000&seek=wat&hdcore=2.11.3&g=ISBQNEIHITHY

** A partir d'une url **

php AdobeHDS.php --delete --manifest "<url>" --auth "<url>&als=0,3,0,1,0,NaN,0,0,0,41,f,0,1260,f,s,ISBQNEIHITHY,2.11.3,41" --useragent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36"

php AdobeHDS.php --delete --manifest "http://web.q1.tf1.fr/2/USP-0x0/39/16/12983916/ssm/12983916.ism/12983916.f4m?vk=MTI5ODM5MTYuZjRt&st=THi63w2mpD9KCvG-NoM3UQ&e=1461030732&t=1460901132&bu=TFOU&login=heidi-tfou&i=90.126.57.100&u=a4aedc160f4db1107389aac31a34e732&sum=04ac0c6c8456b0696bc3d459fda8b811&min_bitrate=700000&max_bitrate=2000000&seek=wat&hdcore=2.11.3&g=ISBQNEIHITHY" --auth "vk=MTI5ODM5MTYuZjRt&st=THi63w2mpD9KCvG-NoM3UQ&e=1461030732&t=1460901132&bu=TFOU&login=heidi-tfou&i=90.126.57.100&u=a4aedc160f4db1107389aac31a34e732&sum=04ac0c6c8456b0696bc3d459fda8b811&min_bitrate=700000&max_bitrate=2000000&seek=wat&hdcore=2.11.3&g=ISBQNEIHITHY&als=0,3,0,1,0,NaN,0,0,0,41,f,0,1260,f,s,ISBQNEIHITHY,2.11.3,41" --useragent "Mozilla/5.0 (X11; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0"

## Télécharger une video de mini-ninjas ##

php AdobeHDS.php --manifest "http://web.q1.tf1.fr/2/USP-0x0/43/22/12984322/ssm/12984322.ism/12984322.f4m?vk=MTI5ODQzMjIuZjRt&st=zTw7RajOop4yyY5Nzk1yEw&e=1461140553&t=1461010953&bu=TFOU&login=mini-ninjas&i=90.126.57.100&u=a4aedc160f4db1107389aac31a34e732&sum=04ac0c6c8456b0696bc3d459fda8b811&min_bitrate=400000&max_bitrate=1000000&seek=wat&hdcore=2.11.3&g=SMKMAJBWFQEP" --delete --auth "vk=MTI5ODQzMjIuZjRt&st=zTw7RajOop4yyY5Nzk1yEw&e=1461140553&t=1461010953&bu=TFOU&login=mini-ninjas&i=90.126.57.100&u=a4aedc160f4db1107389aac31a34e732&sum=04ac0c6c8456b0696bc3d459fda8b811&min_bitrate=400000&max_bitrate=1000000&seek=wat&als=0,2,0,1,0,NaN,0,0,0,125,f,0,629.12,f,s,SMKMAJBWFQEP,2.11.3,125&hdcore=2.11.3" --useragent "Mozilla/5.0 (X11; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0"

==== Robin des bois =====

./run.rb -c '<CMD>' -w "Robin des bois" -i "robin-des-bois" -t "Les cinq marionnettes" -e "29"

==== Mike le chevalier =====

./run.rb -c '<CMD>' -t 'Mike le Chevalier et les objets précieux de Chevalier' -e "34" -s "02" -w "Mike le chevalier" -a -i 'mike-le-chevalier'

==== Heidi =====

./run.rb -c '<CMD>' -w "Heidi" -i "heidi" -t "La lettre" -e "26" -a


==== Mini-ninjas ====

./run.rb -c '<CMD>' -w "Mini Ninjas" -i "mini-ninjas" -t "Suzume contre Suzume" -e "16" -a


Méthode

1. sudo ruby PacketFilter.rb --> url_download
2. ruby TF1SearchProvider.rb <url> --> options
3. ./run.rb -u "<url_download>" <options>

Nouvelle méthode :

sudo ruby run.rb -u ""

Rechercher :

ruby search_tf1.rb robin-des-bois
ruby search_tf1.rb mini-ninjas
ruby search_tf1.rb heidi
