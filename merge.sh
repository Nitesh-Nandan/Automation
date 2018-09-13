eipp_cloud="agent_eipp eipp_common eipp_correspondence eipp_model eipp_ui eipp_core_util eipp_gateway eipp_payment"
branch_name="$1"

if [ -z "$branch_name" ]
then
    echo "Please enter branch_name"
    echo "./merge.sh [ branch_name ]"
    exit 0
fi

for project in $eipp_cloud
    do
        echo "******************* Merging : $project ******************"
        cd $project
        echo "checking out falcondev of $project"
        git checkout falcondev
        echo "merging $branch_name to falcondev."
        git merge $branch_name
        echo "deleting $branch_name in $project."
        git branch -d $branch_name
        echo "deleted the merged branch $branch_name"
        echo "******************** Merging : Finished ********************"
        cd ..
    done
