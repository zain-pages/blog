@echo on
hexo g && hexo d && git add . && git commit -m "bat autoupdate" && git push && pause