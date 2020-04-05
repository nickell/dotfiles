demoBranches=$(git branch | grep "demo/")

git checkout master
git pull origin master

for branch in $demoBranches
do
    git checkout $branch
    git rebase master
    git push origin $branch --force
    echo "$branch rebased!"
done

git checkout master
