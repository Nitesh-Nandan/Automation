eipp_cloud="eipp_ui"
ldapIds="alekya.pabbishet aman.mishra annie.jeyaraj aviral.srivasta kranthi.bejjarapu malay.satapathy mallikarjuna.vel prashant.t pramod.b praveen.tiwary samatha.p sarvani.ch nitesh.nandan"
user_name="$1"
chekout_branch="$2"

if [ -z "$user_name" ]
then
    echo "Please enter your user_name as argument."
    exit 0
fi

if [ -z "$chekout_branch" ]
then
    chekout_branch="falcondev"
fi

for project in $eipp_cloud
do
    echo "*********************cloning: $project *********************"
    git clone ssh://git@10.1.21.28:2211/$user_name/$project.git -b $chekout_branch
    cd $project
	git remote add upstream ssh://git@10.1.21.28:2211/eipp-cloud/$project.git
	
	for ldap in $ldapIds
	do
		git remote add ${ldap^^} ssh://git@10.1.21.28:2211/$ldap/$project.git
	done
	cd ..
done



