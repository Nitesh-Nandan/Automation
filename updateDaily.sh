eipp_cloud="agent_eipp eipp_common eipp_correspondence eipp_model eipp_ui eipp_core_util eipp_gateway eipp_payment"

for project in $eipp_cloud
    do
        cd $project
        echo "*************** Updating : $project***************"
        git checkout falcondev
        git fetch upstream
        git merge upstream/falcondev
        git push origin
        echo "********************** Done *************************"
        cd ..
    done
