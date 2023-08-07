
$grp="az-private_dns-RG"
$location="East US 2"
$vnetName="linked-az-Vnet-1"
$vnetName2="linked-az-Vnet-2"
$subnetName="WebTier"
$subnetName2="BusinessLogicTier1"
$vmName="Vm-001"

# CREATE RESOURCE GROUP
az group create --name $grp --location $location

# CREATE VIRTUAL NETWORK
az network vnet create --address-prefixes 10.0.0.0/16 --name $vnetName --resource-group $grp
az network vnet create --address-prefixes 10.0.0.0/16 --name $vnetName2 --resource-group $grp

# CREATING SUBNETS
az network vnet subnet create -g $grp --vnet-name $vnetName -n $subnetName --address-prefixes 10.2.0.0/24
az network vnet subnet create -g $grp --vnet-name $vnetName2 -n $subnetName2 --address-prefixes 10.5.0.0/24

# CREATING VMs IN SUBNET
az vm create --resource-group $grp --name $vmName --image ubuntults --vnet-name $vnetName --subnet $subnetName --admin-username azureuser --admin-password Hello@12345#

apt-get update -y
apt-get upgrade -y
apt-get install apache2 -y

echo "Hello Business Logic VM!" > /var/www/html/index.html
