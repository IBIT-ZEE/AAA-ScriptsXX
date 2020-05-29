:: EPCWIN backup set

:: ATT*** 
:: redesign with variable for COMMON PATH
:: ?redesign for !!!!BAKS

Call aaa-log %0 %*
::xcopy /s/d/c/y \\server1\d$\BORDALIMA\*.xls D:\!!!!BAKS\Server1\BORDALIMA
xcopy /s/d/c/y/f \\server1\d$\BORDALIMA\Design\EPCWin\*.* D:\BORDALIMA\Design\EPCWin\

echo %0
echo.
echo.



