# Found here: https://stackoverflow.com/questions/2100907/how-to-remove-delete-a-large-file-from-commit-history-in-the-git-repository
git filter-branch --prune-empty -d /dev/shm/scratch \
  --index-filter "git rm --cached -f --ignore-unmatch oops.iso" \
  --tag-name-filter cat -- --all

git update-ref -d refs/original/refs/heads/master
git reflog expire --expire=now --all
git gc --prune=now
