@echo on
hexo g && hexo d && git add . && git commit -m "bat do update" && git push
cmd