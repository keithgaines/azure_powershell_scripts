# ps az module install
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force


# creates new resource group with user provided paramaters stored in group name and location variables
$resourceGroupName = Read-Host -Prompt 'Input the resource group name'
$location = Read-Host -Prompt 'Input the resource group location'

New-AzResourceGroup -Name $resourceGroupName -Location $location

# creates new virtual machine in Azure with given parameters

New-AzVm `
    -ResourceGroupName "ps1ResourceGroup" `
    -Name "ps1vm01" `
    -Location "East US" `
    -VirtualNetworkName "ps1Vnet" `
    -SubnetName "ps1Subnet" `
    -SecurityGroupName "ps1NetworkSecurityGroup" `
    -PublicIpAddressName "myPublicIpAddress" `
    -OpenPorts 80,3389
