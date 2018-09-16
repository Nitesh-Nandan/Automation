eipp_cloud="eipp_ui"
branch_list="develop master duronto/18.10.0 hotfix/18.9.1"

for project in $eipp_cloud
    do
        cd $project
        echo "*************** Updating & Syncing: $project***************"
        echo "***************** Updating & Syncing: falcondev ************"
        git checkout falcondev
        git fetch upstream
        git merge upstream/falcondev
        #git push origin falcondev
        echo "***************** Done : falcondev ************"
        echo ""

        for branch in $branch_list
        do
            echo "***************** Updating & Syncing: $branch ************"
            git checkout origin/$branch
            git checkout -b $branch
            git merge upstream/$branch
            #git push origin $branch
            git checkout falcondev
            git branch -D $branch
            echo "***************** Done : $branch ************"
            echo " "
        done
        echo "********************** Finished : $project *************************"
        echo ""
        echo ""
        cd ..
    done
