#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 保存源码

git init
git add -A
git commit -m 'save blog source'

# 链接远程仓库
git remote add origin https://github.com/xwHsj/hesj-blog-source.git

# 拉取远程仓库文件
git pull --rebase origin master

# 同步更新代码s
git push -u	origin master

# 构建github微博网站
# 生成静态文件
npm run build

# 进入生成的文件夹
cd blog/.vuepress/dist

git init
git add -A
git commit -m 'deploy'

# 如果发布到 https://<USERNAME>.github.io/<REPO>
git push -f git@github.com:xwHsj/hesj-blog.git master:gh-pages

# 链接远程仓库
git remote add origin https://github.com/xwHsj/hesj-blog.git

# 拉取远程仓库文件
git pull --rebase origin master

# 同步更新代码s
git push -u	origin master

cd -