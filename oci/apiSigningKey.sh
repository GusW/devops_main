#!/bin/bash

#######################################################################################################################
######################## This code should be run in your PERSONAL machine not a cloud instance ########################
#######################################################################################################################

######################################################### API #########################################################

targetOCIpath=~/.oci

mkdir -p $targetOCIpath

openssl genrsa -out $targetOCIpath/oci_api_key.pem -aes128 2048

chmod go-rwx $targetOCIpath/oci_api_key.pem
openssl rsa -pubout -in $targetOCIpath/oci_api_key.pem -out ~/.oci/oci_api_key_public.pem

fingerprint=`openssl rsa -pubout -outform DER -in ${targetOCIpath}/oci_api_key.pem | openssl md5 -c | grep stdin`


# TODO check if this is posible to be done via OCI CLI or a more automated way
# TODO check https://docs.cloud.oracle.com/en-us/iaas/api/#/en/identity/20160918/ApiKey/UploadApiKey
echo "*** UPLOAD YOUR KEYS ***
Login to oracle.com/cloud
If you're an admin: Governance and Administration >> Identity >> Users
If you're a normal user: Profile >> User Settings
Click API Keys >> Add Public Key
and enter:
"
cat ${targetOCIpath}/oci_api_key_public.pem
echo "
After adding it you should see the a Fingerprint equals to:
"
echo $fingerprint
sleep 180

####################################################### OCI CLI #######################################################

targetOCIcliName="oci-cli"

echo "Enter path to /${targetOCIcliName} e.g: /home/gusw/code/python_main/venv3"
read targetOCIcliPath

virtualenv -p /usr/bin/python3.6 $targetOCIcliPath/$targetOCIcliName
echo "alias ocienv='source code/python_main/venv3/oci-cli/bin/activate'" >> ~/.bash_aliases
source $targetOCIcliPath/$targetOCIcliName/bin/activate
pip3 install oci-cli

echo "*** USER OCID ***
OCI Console >> Profile >> User Settings"
read userOCID
echo "*** TENANCY OCID ***
OCI Console >> Governance and Administration >> Administration >> Tenancy Details"
read tenancyOCID

echo "Your User OCID is ${userOCID}
Your Tenancy OCID is ${tenancyOCID}
Your
"
oci setup config

# oci session authenticate
# oci session validate --config-file ~/.oci/config --profile <profile_name> --auth security_token
# oci session refresh --profile <profile_name>

################################################## OKE LOCAL ACCESS ###################################################


################################################### PULL FROM OCIR ####################################################

sudo docker login iad.ocir.io

idmacyeswbbg/gustavo.watanabe@gmail.com
# password...

sudo docker pull iad.ocir.io/idmacyeswbbg/redpill-flask-user-api
