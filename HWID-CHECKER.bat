:0
@echo off
mode 87,30
title Serial Checker v1.1
cls
color 1a

echo Serial Number Checker
Serial Checker 1.1
cls
color 1a
echo %date% %time%
echo [32mUser Accounts and SIDs
echo [32m-------------------------------------------------------------------------------------[37m
wmic useraccount get name,sid

echo [32mSystem Motherboard and BIOS
echo [32m-------------------------------------------------------------------------------------[37m
wmic baseboard get serialnumber
wmic path win32_computersystemproduct get uuid

echo [32mCPU - (Central Processing Unit)
echo [32m-------------------------------------------------------------------------------------[37m
wmic cpu get processorid

echo [32mRAM (System Memory) - This may be all zeros
echo [32m-------------------------------------------------------------------------------------[37m
wmic memorychip get serialnumber

echo [32mSSD/HDD - Solid State and Standard Hard Drive(s)
echo [32m-------------------------------------------------------------------------------------[37m
wmic diskdrive get serialnumber

echo [32mGPU - (Graphical Processing Unit)
echo [32m-------------------------------------------------------------------------------------[37m
wmic PATH Win32_VideoController GET Description,PNPDeviceID

echo [32mMAC - (Network Adapter Physical Media Access Control)
echo [32m-------------------------------------------------------------------------------------[37m
wmic path Win32_NetworkAdapter where "PNPDeviceID like '%%PCI%%' AND NetConnectionStatus=2 AND AdapterTypeID='0'" get MacAddress
pause
goto :1