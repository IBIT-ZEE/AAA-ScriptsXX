Call aaa-log %0 %*

:: net user x xx /add
:: net localgroup /add XXX
:: net localgroup XXX /add x

echo ADD USERS
for /F "tokens=1-2,*" %%a in ( bordalima-users.txt  ) do net user /add %%a %%b
echo,
echo,
timeout 60

echo ADD GROUPS
for /F "tokens=1"     %%a in ( bordalima-groups.txt  ) do net localgroup /add %%a
echo,
echo,
Timeout 60

echo CONNECT
for /F "tokens=1-2,*" %%a in ( bordalima-usersgroups.txt  ) do net localgroup %%a /add %%b
echo,
echo,
::Timeout 60


