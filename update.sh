eipp_cloud="agent_eipp eipp_common eipp_correspondence eipp_model eipp_ui eipp_core_util eipp_gateway eipp_payment"
eipp_ui="eipp_common eipp_correspondence eipp_model eipp_ui eipp_core_util eipp_gateway eipp_payment"

if [ "$1" == 'all' ]
then
    for project in $eipp_cloud
    do
        cd $project
        git fetch master
        cd ..
    done

else
    for project in $eipp_ui
    do
        cd $project
        git fetch master
        cd ..
    done
fi

