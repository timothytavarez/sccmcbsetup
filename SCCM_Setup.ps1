## Title:  Setup System Center Configuration Manager (Current branch / 1606) environment
## Author: Timothy Tavarez - timothy.tavarez@microsoft.com
## Date:   3/28/2017
## Semver: 0.1

#########################################

#### Customizable variables

## Set the path on the local host to storage the virtual disks. Defaults to C:\VHD\.

$vhdPath = 

## Set the path of your Windows Server 2016 .iso file.
$2016ISOPath = "C:\Users\titavare\Documents\ISO\en_windows_server_2016_x64_dvd_9718492.iso"


#### Script variables

$extSwitch = "SCCM Lab External Switch"
$dc = "Windows Server 2016 - Domain Controller"


## Check for null variable values.

if ($hostPath -eq [String]::Empty) {
    return $hostPath = "C:\VHD\SCCMDC.vhdx"
}


## Create an external switch so our environment can interact with the host OS network adapter to download updates.


## Create a VM group so we can reference our collection.

New-VMGroup -Name "SCCM Lab" -GroupType VMCollectionType

## Create our VMs.

New-VM -Name $dc -MemoryStartupBytes 2048MB -NewVHDPath SCCMDC.vhdx -NewVHDSizeBytes 40000000000 -Generation 2
##Set-VMDvdDrive -VMName $dc -Path $2016ISOPath