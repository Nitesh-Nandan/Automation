eipp_cloud="agent_eipp eipp_common eipp_correspondence eipp_model eipp_ui eipp_core_util eipp_gateway eipp_payment"
eipp_ui="eipp_common eipp_correspondence eipp_model eipp_ui eipp_core_util eipp_gateway eipp_payment"
user_story="$1"
arg2="$2"
total_arg="$#"

if [ "$total_arg" -eq 2 ]
then
    if [ "$arg2" == 'all' ]
    then
        for project in $eipp_cloud
        do
             cd $project
             git checkout falcondev
             echo "git checkout -b $user_story"
             git checkout -b $user_story
             cd ..
        done
    else
        echo "Invalid second argument.Use all or none as parameter"
    fi
elif [ "$total_arg" -eq 1 ]
    then
        for project in $eipp_ui
        do
            cd $project
            git checkout falcondev
            echo "git checkout -b $user_story"
            git checkout -b $user_story
            cd ..
        done
else
    echo "Invalid command."
fi

