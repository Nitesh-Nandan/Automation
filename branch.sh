eipp_cloud="agent_eipp eipp_common eipp_correspondence eipp_model eipp_ui eipp_core_util eipp_gateway eipp_payment"
branch_name="$1"

if [ -z "$branch_name" ]
then
    echo "Please enter branch_name"
    echo "./branch.sh [ branch_name ]"
    exit 0
fi

for project in $eipp_cloud
    do
        echo "************* Creating Branch : $branch_name in $project **************"
        cd $project
        echo "checking out falcondev of $project"
        git checkout falcondev
        echo "creating $branch_name and checkingout $branch_name."
        git checkout -b "$branch_name"
        cd ..
    done
