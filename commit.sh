#!bin/bash

dates=("2025-02-11T10:00:00" "2025-02-19T10:00:00" "2025-02-27T10:00:00")
commit_message="NewVersion-Commit-IERC721-IDO-Tech"

for date in "${dates[@]}"
do
    # Set environment variables to backdate the commit
    export GIT_AUTHOR_DATE=$date
    export GIT_COMMITTER_DATE=$date
    
    # Create an empty commit with the backdated timestamp
    git commit --allow-empty -m "$commit_message"

    # Optional: To verify each commit, you can print the date of each commit
    echo "Created commit for $date"
done

# Push all the commits to the remote repository
git push origin main