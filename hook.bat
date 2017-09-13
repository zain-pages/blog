@echo on
git add .
git commit -m "bat autoupdate"
git push
hexo g
hexo d
pause