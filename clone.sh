eipp_cloud="agent_eipp eipp_common eipp_correspondence eipp_model eipp_ui eipp_core_util eipp_gateway eipp_payment"
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
    cd ..
done



