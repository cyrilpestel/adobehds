
## Convertir un fichier flv en mp4 ##
avconv -i 7a77e018df5a03ba3d470504bb3e3977_690ce18c54067c0876c2ebbd56f99688_Seg1-Frag.flv -codec copy "Doublement Marianne - S01E30.mp4"

## Télécharger une video au format flv ##
ruby run.rb 'php AdobeHDS.php --manifest "http://web.q1.tf1.fr/2/USP-0x0/37/48/12973748/ssm/12973748.ism/12973748.f4m?vk=MTI5NzM3NDguZjRt&st=xec3RuXYtJeyXBbUiYtExw&e=1458373206&t=1458243606&bu=TFOU&login=robin-des-bois-tfou&i=109.221.133.144&u=a4aedc160f4db1107389aac31a34e732&sum=5a0a44755960214f1b01e6ea550de796&min_bitrate=700000&max_bitrate=2000000&seek=wat&hdcore=2.11.3&g=HWYXWVCADHPV" --delete --auth "vk=MTI5NzM3NDguZjRt&st=xec3RuXYtJeyXBbUiYtExw&e=1458373206&t=1458243606&bu=TFOU&login=robin-des-bois-tfou&i=109.221.133.144&u=a4aedc160f4db1107389aac31a34e732&sum=5a0a44755960214f1b01e6ea550de796&min_bitrate=700000&max_bitrate=2000000&seek=wat&als=0,2,0,1,0,NaN,0,0,0,127,f,0,659.52,f,s,HWYXWVCADHPV,2.11.3,127&hdcore=2.11.3" --useragent "Mozilla/5.0 (X11; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0"' "La flèche magique" "2"

==== Robin des bois =====

./run.rb -c '<CMD>' -w "Robin des bois" -i "robin-des-bois" -t "Les cinq marionnettes" -e "29"

==== Mike le chevalier =====

./run.rb -c '<CMD>' -t 'Mike le Chevalier et les objets précieux de Chevalier' -e "34" -s "02" -w "Mike le chevalier" -a -i 'mike-le-chevalier'

==== Heidi =====

./run.rb -c '<CMD>' -w "Heidi" -i "heidi" -t "La lettre" -e "26" -a