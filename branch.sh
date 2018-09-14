eipp_cloud="agent_eipp eipp_common eipp_correspondence eipp_model eipp_ui eipp_core_util eipp_gateway eipp_payment"
operation="$1"
branch_name="$2"

if [ "$#" -ne 2 ]
then
    echo "Invalid Command"
    echo "./branch.sh [sw/csw] [ branch_name ]"
    exit 0
fi


if [ "$operation" == 'csw' ]
then
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

elif [ "$operation" == 'sw' ]
then
    for project in $eipp_cloud
     do
        echo "************* Switching Branch : $branch_name in $project **************"
        cd $project
        echo "checking out $branch_name of $project"
        git checkout $branch_name
        cd ..
     done
else
    echo "Invalid operation"
    echo "./branch.sh [sw/csw] [ branch_name ]"
fi
