eipp_cloud="agent_eipp eipp_common eipp_correspondence eipp_model eipp_ui eipp_core_util eipp_gateway eipp_payment eipp_agent_launcher eipp_root eipp_database eipp_accountsetup"
branch_name="$1"
operation="$2"
file_suffix="_merge_summary.txt"
filename="$1$file_suffix"
rm -rf $filename
touch $filename


if [ -z "$1" ]
then
    echo "Please enter branch_name"
    echo "./feature.sh [ branch_name ]"
    exit 0
fi

for project in $eipp_cloud
    do
        echo "******************* Merging : $project ******************"
        cd $project
        echo "checking out falcondev of $project"
        git checkout $branch_name
        echo "*****************************$project: Consolidated Summary ****************************** " >> ../$filename
        
        echo "##### Compact Diff Summary #####" >> ../$filename
        git diff --compact-summary falcondev >> ../$filename
        echo "" >> ../$filename
        
        git checkout falcondev

        echo "merging $branch_name to falcondev."
        git merge $branch_name --no-edit
        echo "******************** Merging : Finished ********************"
        echo "##### Conflict file-name #####" >> ../$filename
        find . -type f -print0 | xargs -0  grep -l "<<<<<" >> ../$filename
        echo "" >> ../$filename
        echo "" >> ../$filename
        git checkout $branch_name
        echo "*****************************Consolidated Summary : $project END ****************************** " >> ../$filename
        cd ..
    done
