
region              = "us-east-1"
path_to_public_key  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMS66udE9CxyqjagK3pfZVGnI2syvxqXBtJYGoTQBw4IuL5plv/dhBnPQ/q8aaYDJDzmO/cmgTFdkSarp11cU5IVKNWNP4K5K48AjtKEZOsmo06bhvQGDzolh6aJw3oOLX7P9mOArbwUj3/JsdIPwHHAO3fDVzTBiJuS1u0y+73kil6k8eDQRv5OM69TbvnSncZv2bQQkeTV437OiT86KPHwKh2zRhgP/M179fPwmQR+fyi7d42s/hSSFs2CdHMR9TpHY3BEv2OFgQ/3X8B15sHZfQpXf7lQRWdUMz+hiAl7ZkjfmR92lqefepig3pVLN092ShDJOZdX6hAK9fAOKv noname"
path_to_private_key = "-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABFwAAAAdzc2gtcn
NhAAAAAwEAAQAAAQEAzEuurnRPQscqo2oCt6X2VRpyNrMr8alwbSWBqE0AcOCLi+aZb/3Y
QZz0P6vGmmAyQ85jv3JoExXZEmq6ddXFOSFSjVjT+CuSuPAI7ShGTrJqNOm4b0Bg86JYem
icN6Di1+z/ZjgK28FI9/ybHSD8BxwDt3w1c0wYibktbtMvu95IpepPHg0Eb+TjOvU2750p
3Gb9m0EJHk1eN+zok/Oijx8Cods0YYD/zNe/Xz8JkEfn8ou3eNrP4UkhbNgnRzEfU6R2Nw
RL9jhYEP91/AdebB2X0KV3+5UEVnVDM/oYgJe2ZI35kfdpann3qYoN6VSzdPdkoQyTmXV+
oQCvXwDirwAAA8BQFaSFUBWkhQAAAAdzc2gtcnNhAAABAQDMS66udE9CxyqjagK3pfZVGn
I2syvxqXBtJYGoTQBw4IuL5plv/dhBnPQ/q8aaYDJDzmO/cmgTFdkSarp11cU5IVKNWNP4
K5K48AjtKEZOsmo06bhvQGDzolh6aJw3oOLX7P9mOArbwUj3/JsdIPwHHAO3fDVzTBiJuS
1u0y+73kil6k8eDQRv5OM69TbvnSncZv2bQQkeTV437OiT86KPHwKh2zRhgP/M179fPwmQ
R+fyi7d42s/hSSFs2CdHMR9TpHY3BEv2OFgQ/3X8B15sHZfQpXf7lQRWdUMz+hiAl7Zkjf
mR92lqefepig3pVLN092ShDJOZdX6hAK9fAOKvAAAAAwEAAQAAAQEAsnmzw4is7ePdZiHo
+dOtXi/ac9sXmumx5EiN+yA6MGKaxr/QcDxNvxSFdVJ2EMvVXdNi5Q/nyDSgDSzcdLEquX
xZCE7/76Dxb0uUIMu8kGfhzRQaImcVzAKaVWYqg5a0VnsfrIdtRQqY2rz+LfZw9y0MOjHy
6CUkkr0J6fXpj69Txdz3AlglKFSuX5b5ZDG3TkhA9zALBNXiFj9G+3pfKjaElt1XlxPgqW
Wr//yZbCLgo53S+YT/FdIZkrWRBQQd4SoZL+YVRTuCH6SfRZ95Xe4s8WSNvFH4puAPAm7B
bpO3k04nOkoE/OgL1cq3MireXF7RcQDcQkzcv6J5TGvvcQAAAIEA2p9IoXiM1xxE6MeOHz
ed6tUIADf/lupVemHrWeV71L0433H//nuGqyilUYbNogc+TIutI5bzOVmFoXT8JqnvvTSZ
HzrM9VnFiv6MYEiE9XDXX8h4PZNr7aHyzb9PyDKeRZsoSu1pa6ibBR4tks7tVVt2l/qNbQ
StU9xgVci9P2UAAACBAO7mcwyVZeuNuKs466+/3Ms/RpTmbCHAQ0DdqRvLislQ8JeFjOmj
MjlVI2pUrK4/g9OAOilI1N6Pyt+q5+vHNsN3k5G+y2BWfjg3eYPCH4ky3DnaQbfOM7cLJf
2l2hdZNh4G165LZPWRRVm98VTrMv7WCh9EDOBq2ShTY/OypybVAAAAgQDa6yWueWHtqWfh
dc+lqqmhekd7jQqe//WRwgdcPJzY1DQzX8KdiDvxfBpKH7fh7N3if/jMIs5hKOyaNtcK1O
acCz9NknRLSTsNh7Q4WBVkHH0wbbsh/xzC7i2cvAT/mc5BkIZy3x5RcS417W1mdRqTcC22
U7uh0byY7GH8JTstcwAAAAZub25hbWUBAgM=
-----END OPENSSH PRIVATE KEY-----
"
instance_username   = "ec2-user"
cidr_block          = "10.0.0.0/16"
sec_group_name      = "my_sg"
public_subnet1      = "10.0.4.0/24"
public_subnet2      = "10.0.5.0/24"
public_subnet3      = "10.0.6.0/24"
private_subnet1     = "10.0.101.0/24"
private_subnet2     = "10.0.102.0/24"
private_subnet3     = "10.0.103.0/24"
azs = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c"
]

database_name      = "my_database"
cluster_identifier = "database-1"
master_username    = "team1"
master_password    = "wH8ru2XgaZFY"

tags = {
  Dept = "Devops"
  Team = "Team1"
}

#domain = "wakulovszki.com"
#zone_id = "Z0593479FX68DGYT6E83"

domain = "treenetsolution.com"
zone_id = "Z02170421JNU7XEVMBN6G"
