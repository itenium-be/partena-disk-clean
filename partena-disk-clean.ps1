# Because the drive is full every 2 months.

# Download nuget: https://dist.nuget.org/win-x86-commandline/latest/nuget.exe
.\nuget.exe locals all -clear



# Clear-RecycleBin doesn't exist in PowerShell Core?
Get-ChildItem -Path 'C:\$Recycle.Bin' -Force | Remove-Item -Recurse -ErrorAction SilentlyContinue


# Need Administrator permissions for the following:


# ServiceFabric:
# Some code located in: C:\Program Files\Microsoft SDKs\Service Fabric\ClusterSetup
# But let's do it without installing the ServiceFabric Module:
Stop-Service FabricHostSvc

Get-ChildItem -Path 'C:\SfDevCluster\Data\ReplicatorLog\*' -Force | Remove-Item

Get-ChildItem -Path 'C:\SfDevCluster\Log\Traces\*' -Force | Remove-Item
Get-ChildItem -Path 'C:\SfDevCluster\Log\QueryTraces\*' -Force | Remove-Item
Get-ChildItem -Path 'C:\SfDevCluster\Log\OperationalTraces\*' -Force | Remove-Item

Start-Service FabricHostSvc
