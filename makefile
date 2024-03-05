c:
	g++ *.cpp
r:
	./a.out

# for github ... 
p:
	git fetch
git:
	git add -A ; git commit -m "sync" ; git push
